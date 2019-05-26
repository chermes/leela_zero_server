<!-- vim:set et sw=2 ts=2 ft=html: -->
<template>
  <b-container>
    <b-jumbotron header="Go Analysis Server" lead="Use Leela Zero to evaluate Go / Baduk / Weiqi games.">
      <b-button-toolbar>
        <b-dropdown variant="primary" class="mx-1" right text="Upload Game">
          <b-dropdown-item>SGF File</b-dropdown-item>
          <b-dropdown-item>SGF Raw String</b-dropdown-item>
          <b-dropdown-divider></b-dropdown-divider>
          <b-dropdown-item>OGS ID</b-dropdown-item>
          <b-dropdown-item>OGS Link</b-dropdown-item>
          <b-dropdown-item>OGS Username</b-dropdown-item>
        </b-dropdown>
        <b-button-group class="mx-1">
          <b-button variant="outline-primary">
            <b-form-checkbox switch>LeelaZero Training</b-form-checkbox>
          </b-button>
        </b-button-group>
        <b-button-group class="mx-1">
          <b-dropdown variant="primary" class="mx-1" right text="References">
            <b-dropdown-item href="https://github.com/chermes/leela_zero_server/">GitHub Project Page</b-dropdown-item>
            <b-dropdown-item>API Documentation</b-dropdown-item>
          <b-dropdown-divider></b-dropdown-divider>
            <b-dropdown-item>Leela Zero Project</b-dropdown-item>
            <b-dropdown-item>SGF Analyzer Project</b-dropdown-item>
          </b-dropdown>
        </b-button-group>
      </b-button-toolbar>
    </b-jumbotron>

    <b-form-group horizontal :label-cols="4" description="Let us know your name." label="Enter your name">
      <b-form-input v-model.trim="name"></b-form-input>
    </b-form-group>

    <b-alert variant="success" :show="showAlert">Hello {{ name }}</b-alert>

    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </b-container>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'app',
  components: {
    HelloWorld
  }
}
</script>

<style>
</style>
