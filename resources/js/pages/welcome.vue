<template>
  <div class="w-100">
    <navbar />
    <div>
        <div class="d-block d-sm-none">
          <div class="p-3">
            <div>
              <h1 class="text-black">Welcome to your competitive community</h1>
            </div>
          </div>
          <div>
            <img src="/svg/Team building importance in business success.svg" class="img-fluid" alt="illustration">
          </div>
        </div>
        <div class="d-none d-sm-block d-sm-none d-md-block">
          <div class="pl-165 pr-12">
            <div class="row">
              <div class="col my-auto">
                <h1 id="welcome-header" class="text-black">Welcome to your competitive community</h1>
              </div>
              <div class="col pt-40">
                <img src="/svg/Team building importance in business success 2.svg" class="img-fluid" alt="illustration">
              </div>
            </div>
          </div>
        </div>
        <div id="find-people-container" class="h-446 py-170 background-color-1">
          <div id="find-people-button" class="text-center">
            <router-link id="find-people-you-need-button" :to="{ name: 'login' }" tag="button" class="py-3 px-5 btn btn-1 btn-lg text-white">Find team you need</router-link>
          </div>
        </div>
        <div id="kita-join-users-container" class="h-720 py-260 px-438 bg-white text-center">
          <div id="who-container" class="w-564">
            <h1 id="who-header" class="mb-0 text-black">Who is KITAJOIN for?</h1>
            <h1 id="polban-student-header" class="mt-3 mb-0 font-weight-light text-black">Any Bandung State Polytechnic student looking to navigate their life</h1>
          </div>
        </div>
        <div id="get-started" class="background-color-1">
          <div class="py-80 text-center">
            <h1 id="join-teams-text" class="mb-4 px-165 text-white">Join your colleagues, classmates, and friends on KITAJOIN.</h1>
            <router-link id="get-started-button" :to="{ name: 'login' }" tag="button" class="mt-20 btn btn-lg text-white">Get started</router-link>
          </div>
        </div>
        <div id="kita-join-users-container " class="background-color-black">
          <div class="p-3">
            <p id="footer-copy-text" class="text-white font-weight-light text-center mb-0">KITAJOIN © 2020</p>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Navbar from '~/components/Navbar'

export default {
  layout: 'basic',

  metaInfo () {
    return { title: this.$t('home') }
  },

  data: () => ({
    title: window.config.appName
  }),

  computed: mapGetters({
    authenticated: 'auth/check'
  }),

  components: {
    Navbar
  }
}
</script>

<style scoped>
  .top-right {
    position: absolute;
    right: 10px;
    top: 18px;
  }

  .title {
    font-size: 85px;
  }

  #copyright {
    height: auto;
  }

  #footer-copy-text {
    font-size: 0.75rem;
  }

  #join-teams-text {
    color: black
  }

  #get-started-button {
    border-radius: 28px !important;
    background-color: black;
    font-size: 1.5rem;
  }

  #not-available {
    padding: 120px;
  }

  #not-available p {
    margin-bottom: 36px;
    font-size: 1.125em;
    color: #A7A7A7;
  }

  #not-available-container {
    padding-left: 80px;
    padding-right: 80px;
  }

  #laptop {
    width: 180px;
    height: 216px;
  }

  #laptop, #oops {
    color: black;
  }

  .text-black {
    color: black;
  }

  #welcome-header {
    font-size: 5rem;
  }

  .py-170 {
    padding-top: 170px;
    padding-bottom: 170px;
  }

  .py-260 {
    padding-top: 260px;
    padding-bottom: 260px;
  }

  .px-438 {
    padding-left: 438px;
    padding-right: 438px;
  }

  .pt-40 {
    padding-top: 40px;
  }

  .pr-12 {
    padding-right: 12px
  }

  .pl-165 {
    padding-left: 165px;
  }

  .w-564 {
    width: 564px;
  }

  .h-446 {
    height: 446px;
  }

  .h-720 {
    height: 720px;
  }

  .mt-20 {
    margin-top: 20px;
  }

  .py-80 {
    padding-top: 80px;
    padding-bottom: 80px;
  }

  .px-165 {
    padding-left: 165px;
    padding-right: 165px;
  }

  .background-color-black {
    background-color: black;
  }

  .background-color-1 {
    background-color: #F7AB4F;
  }

  #find-people-you-need-button {
    font-size: 3rem;
    border-radius: 56px !important;
  }

  .btn-1 {
    background-color: black;
  }

  #join-teams-text {
    font-size: 3.5rem;
  }

  @media (max-width: 1000px) {
    #find-people-container {
      height: auto;
      margin: 40px 0 0 0;
      padding: 0;
      background-color: white !important;
    }

    #kita-join-users-container {
      height: auto;
      margin: 40px 0 0 0;
      padding: 0;
    }

    #get-started {
      margin: 40px 0 0 0;
    }

    #find-people-you-need-button {
      font-size: 1.25rem;
      padding: 8px 16px !important;
    }

    #who-header, #polban-student-header {
      font-size: 2rem;
    }

    #who-container {
      width: auto;
    }

    #join-teams-text {
      padding: 0;
      font-size: 2rem;
    }

    #get-started-button {
      font-size: 1.25rem;
    }
  }

  @media (min-width: 768px) {
    .h-text-white {
      text-align: center;
      color: white !important;
    }

    #find-people-button, #kita-join-users-container {
      text-align: center;
    }

    img {
      width: auto;
      height: 100%;
    }
  }
</style>
