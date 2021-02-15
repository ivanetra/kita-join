<template>
  <div class="main-layout">
    <navbar />
    <div class="container">
      <child />
    </div>
  </div>
</template>

<style>
  body {
    background-color: white;
  }
</style>
<script>
import Navbar from '~/components/Navbar'

export default {
  name: 'MainLayout',

  components: {
    Navbar
  }
}
</script>
