<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Go API" FOLDED="false" ID="ID_589159613" CREATED="1557085032286" MODIFIED="1557085055442" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="9" RULE="ON_BRANCH_CREATION"/>
<node TEXT="api" POSITION="right" ID="ID_144943947" CREATED="1557168431692" MODIFIED="1557168577504">
<edge COLOR="#00007c"/>
<font BOLD="true" ITALIC="false"/>
<node TEXT="game/" ID="ID_1853707191" CREATED="1557085213435" MODIFIED="1557170858689">
<font BOLD="true"/>
<node TEXT="list" ID="ID_831796552" CREATED="1557085215931" MODIFIED="1557428015092">
<font BOLD="true"/>
<node TEXT="stats" ID="ID_1213674025" CREATED="1557428064041" MODIFIED="1557428074042">
<font BOLD="true"/>
<node TEXT="returns" ID="ID_1651328029" CREATED="1557170840800" MODIFIED="1557170854729">
<font ITALIC="false"/>
<node TEXT="list_stats" ID="ID_408615461" CREATED="1557170921153" MODIFIED="1557170955569">
<font ITALIC="true"/>
</node>
</node>
</node>
<node TEXT="all" ID="ID_1907719445" CREATED="1557428015930" MODIFIED="1557428059218">
<font BOLD="true"/>
<node TEXT="input" ID="ID_1120058596" CREATED="1557428049834" MODIFIED="1557428051876">
<node TEXT="list_filter" ID="ID_1766183416" CREATED="1557428052666" MODIFIED="1557428057338">
<font ITALIC="true"/>
</node>
</node>
<node TEXT="returns []" ID="ID_1508034912" CREATED="1557170690087" MODIFIED="1557170697346">
<node TEXT="go_game" ID="ID_1997446733" CREATED="1557170698064" MODIFIED="1557170701584">
<font ITALIC="true"/>
</node>
</node>
</node>
<node TEXT="needs_analysis" ID="ID_1889629552" CREATED="1557428253600" MODIFIED="1557429050066">
<font BOLD="true"/>
<node TEXT="returns []" ID="ID_1637431213" CREATED="1557170690087" MODIFIED="1557665928046">
<node TEXT="go_game" ID="ID_1111505419" CREATED="1557170698064" MODIFIED="1557170701584">
<font ITALIC="true"/>
</node>
</node>
</node>
</node>
<node TEXT="delete" ID="ID_1295768095" CREATED="1557085569047" MODIFIED="1557170862769">
<font BOLD="true"/>
</node>
<node TEXT="reserve_for_analysis" ID="ID_1616344590" CREATED="1557665900027" MODIFIED="1557666122179">
<font BOLD="true"/>
<node TEXT="returns" ID="ID_963354544" CREATED="1557665914243" MODIFIED="1557665915558">
<node TEXT="go_game" ID="ID_1502445578" CREATED="1557665916123" MODIFIED="1557665918486"/>
</node>
</node>
<node TEXT="update" ID="ID_1105595237" CREATED="1557085595349" MODIFIED="1557170863201">
<font BOLD="true"/>
<node TEXT="input" ID="ID_1601851252" CREATED="1557429174213" MODIFIED="1557429176384">
<node TEXT="go_game" ID="ID_325277791" CREATED="1557429177292" MODIFIED="1557429192304">
<font ITALIC="true"/>
</node>
</node>
</node>
<node TEXT="download" ID="ID_1873904492" CREATED="1557085133530" MODIFIED="1557170873953">
<font BOLD="true"/>
<node TEXT="sgf" ID="ID_1989242305" CREATED="1557168217178" MODIFIED="1557170873956">
<font BOLD="true"/>
<node TEXT="file" ID="ID_1875828429" CREATED="1557168218690" MODIFIED="1557170873956">
<font BOLD="true"/>
</node>
<node TEXT="string" ID="ID_863372352" CREATED="1557168220122" MODIFIED="1557170873956">
<font BOLD="true"/>
</node>
</node>
<node TEXT="win_rate" ID="ID_1382339492" CREATED="1557085790278" MODIFIED="1557170873957">
<font BOLD="true"/>
</node>
</node>
<node TEXT="upload" ID="ID_1831737546" CREATED="1557085068928" MODIFIED="1557170868697">
<font BOLD="true"/>
<node TEXT="sgf" ID="ID_776026031" CREATED="1557168245746" MODIFIED="1557170868699">
<font BOLD="true"/>
<node TEXT="file" ID="ID_1057338282" CREATED="1557168248874" MODIFIED="1557170868700">
<font BOLD="true"/>
</node>
<node TEXT="string" ID="ID_811286746" CREATED="1557168250322" MODIFIED="1557170868701">
<font BOLD="true"/>
</node>
<node TEXT="url" ID="ID_890198572" CREATED="1557168254122" MODIFIED="1557170868701">
<font BOLD="true"/>
</node>
</node>
<node TEXT="ogs" ID="ID_1282616712" CREATED="1557085082272" MODIFIED="1557170868702">
<font BOLD="true"/>
<node TEXT="id" ID="ID_1152392730" CREATED="1557868040567" MODIFIED="1557868043375">
<font BOLD="true"/>
</node>
<node TEXT="link" ID="ID_991235352" CREATED="1557168270899" MODIFIED="1557170868702">
<font BOLD="true"/>
</node>
</node>
</node>
</node>
<node TEXT="selfplay/" ID="ID_1012020585" CREATED="1557682410643" MODIFIED="1557682517575">
<font BOLD="true"/>
<node TEXT="turn_on" ID="ID_283447783" CREATED="1557682458875" MODIFIED="1557682469723">
<font BOLD="true"/>
</node>
<node TEXT="turn_off" ID="ID_1628856608" CREATED="1557682463042" MODIFIED="1557682470234">
<font BOLD="true"/>
</node>
</node>
<node TEXT="maintenance/" ID="ID_472377561" CREATED="1557168456649" MODIFIED="1557170859345">
<font BOLD="true"/>
</node>
</node>
<node TEXT="models" POSITION="left" ID="ID_56564119" CREATED="1557168437523" MODIFIED="1557168575600">
<edge COLOR="#7c007c"/>
<font BOLD="true" ITALIC="false"/>
<node TEXT="go_game" ID="ID_684286583" CREATED="1557085386711" MODIFIED="1557168485168">
<node TEXT="id" ID="ID_411445396" CREATED="1557170097833" MODIFIED="1557170099298"/>
<node TEXT="name" ID="ID_297122714" CREATED="1557085434085" MODIFIED="1557085435310"/>
<node TEXT="sgf_orig" ID="ID_1169920154" CREATED="1557085397151" MODIFIED="1557085543411"/>
<node TEXT="creation_date" ID="ID_385605680" CREATED="1557168553018" MODIFIED="1557168558356"/>
<node TEXT="status" ID="ID_1749576803" CREATED="1557085399079" MODIFIED="1557085400122">
<node TEXT="is_finished" ID="ID_446846876" CREATED="1557085494947" MODIFIED="1557085654689"/>
<node TEXT="is_running" ID="ID_1939121792" CREATED="1557085524753" MODIFIED="1557085530332"/>
<node TEXT="progress" ID="ID_927312207" CREATED="1557777690951" MODIFIED="1557777693690"/>
</node>
<node TEXT="sgf_analysed&#xa;(optional)" ID="ID_931193610" CREATED="1557085543744" MODIFIED="1557168384602"/>
<node TEXT="win_rate []&#xa;(optional)" ID="ID_1454023457" CREATED="1557085683921" MODIFIED="1557168390974">
<node TEXT="move" ID="ID_620373457" CREATED="1557085727560" MODIFIED="1557085734946"/>
<node TEXT="win_rate_black" ID="ID_1201810077" CREATED="1557085735208" MODIFIED="1557085763121"/>
</node>
</node>
<node TEXT="list_stats" ID="ID_969101623" CREATED="1557170938025" MODIFIED="1557170941435">
<node TEXT="n_games" ID="ID_148309143" CREATED="1557170945928" MODIFIED="1557170948099"/>
</node>
<node TEXT="list_filter" ID="ID_1231789525" CREATED="1557170709464" MODIFIED="1557170712682">
<node TEXT="n_elems" ID="ID_1058258051" CREATED="1557170718952" MODIFIED="1557428200963"/>
<node TEXT="offset" ID="ID_1942502046" CREATED="1557170746824" MODIFIED="1557428203803"/>
</node>
</node>
</node>
</map>
