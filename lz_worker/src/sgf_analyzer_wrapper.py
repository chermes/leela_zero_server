#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
A convenience wrapper for the sgf-analyzer scripts.
"""
import os
import os.path as osp
from subprocess import Popen, PIPE
import tempfile
import re

from sgfmill import sgf as sgfmill

regex_analyze_progress = re.compile(r'.*Analysis done for ([0-9]+)/([0-9]+) move.*')
regex_winrate = re.compile(r'Overall black win\%: ([0-9]+\.[0-9]+)\%')


def get_sgf_analyzer_dir():
    """
    Returns the directory of the sgf-analyzer program.
    """
    if 'SGF_ANALYZER_DIR' in os.environ.keys():
        return os.environ['SGF_ANALYZER_DIR']
    else:
        # default path in container
        return '/opt/sgf-analyzer'


def analyze_game(sgf):
    """
    Run the sgf-analyzer program on the given SGF content.

    Parameters
    ----------
    sgf : str
        SGF content as a string.

    Returns
    -------
    A generator of ...
        progress_perc : float
            Evaluation progress [%].
        sgf_analyzed : str
            Analyzed SGF game with comments. Only in the last iteration.
        win_rate_b : list (move_num: int, win_rate: float)
            Black's win rate per move. Only in the last iteration.
    """
    sgf_analyzed = ''
    win_rate_b = []

    with tempfile.TemporaryDirectory() as tmp_dir:
        # write sgf file
        with open(osp.join(tmp_dir, 'game.sgf'), 'wt') as fid:
            fid.write(sgf)

        # analyze the game
        cmd_dir = get_sgf_analyzer_dir()
        proc = Popen(['python3', 'sgfanalyze.py', osp.join(tmp_dir, 'game.sgf')],
                     stdout=PIPE, cwd=cmd_dir)

        # parse the output for status messages
        while True:
            line = proc.stdout.readline()
            if line == b'':
                break

            print('SGFA', line.decode('ascii').strip())

            # parse possible progress
            m = regex_analyze_progress.match(line.decode('ascii').strip())
            if m is not None:
                n = int(m.group(1))
                N = int(m.group(2))
                progress = float(n) / N * 100.
                yield progress, None, None

        proc.wait()

        # get the results
        with open(osp.join(tmp_dir, 'game_leela-zero.sgf'), 'rt') as fid:
            sgf_analyzed = ''.join(fid.readlines())

        # parse the win rate out of the comments
        with open(osp.join('/tmp', 'test.sgf'), 'wt') as fid:
            fid.write(sgf_analyzed)

        game = sgfmill.Sgf_game.from_string(sgf_analyzed)
        for move, node in enumerate(game.get_main_sequence()):
            if node.has_property('C'):
                comment = node.get('C')
                m = regex_winrate.match(comment)
                if m is not None:
                    win_rate_b.append((move, float(m.group(1))))

    yield 100.0, sgf_analyzed, win_rate_b


if __name__ == "__main__":
    sgf = '(;GM[1]FF[4]AP[qGo:2.1.0]ST[1] SZ[19]HA[0]KM[5.5]PW[White]PB[Black] ;B[pd];W[dp];B[qp];W[dd];B[nq])'

    for p, sgf_a, r in analyze_game(sgf):
        print(p)

    print('Final:')
    print(sgf_a)
    print(r)
