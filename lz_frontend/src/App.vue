<!-- vim:set et sw=2 ts=2 ft=html: -->
<template>
  <b-container>
    <b-jumbotron header="Go Analysis Server" lead="Use Leela Zero to evaluate Go / Baduk / Weiqi games.">
      <!-- <p>For more information visit our website</p> -->
      <b-btn variant="primary" href="https://github.com/chermes/leela_zero_server/">GitHub Page</b-btn>
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
