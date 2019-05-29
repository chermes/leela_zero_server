<!-- vim:set et sw=2 ts=2 ft=html: -->
<template>
  <b-table striped :items="games" :fields="fields">

    <template slot="status" slot-scope="row">
      <b-progress v-show="row.value.is_running & !row.value.is_finished"
                  :value="row.value.progress"
                  :max="100"
                  show-progress
                  animated>
      </b-progress>
      <div v-show="row.value.is_finished">
        Inspect
      </div>
      <div v-show="!row.value.is_finished & !row.value.is_running">
        Waiting
      </div>
    </template>

  </b-table>

</template>

<script charset="utf-8">
  import axios from 'axios';

  export default {
    name: 'GameList',
    props: {},
    data() {
      return {
        games: [],
        fields: [
            {key: "name", label: "Title"},
            {key: "status", label: "Status"}
        ],
      }
    },
    mounted() {
      this.getGames();

      setInterval(this.getGames, 5 * 1000);
    },
    methods: {
      getGames: function () {
        axios.post("http://localhost:5000/game/list/all")
        .then((response)  =>  {
          this.games = response.data;
        })
      }
    }
  }
</script>
