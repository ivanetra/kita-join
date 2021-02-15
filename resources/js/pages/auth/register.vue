<template>
  <div class="w-100">
    <div id="register-container" class="row">
      <div class="col my-auto">
        <div v-if="mustVerifyEmail" id="container" class="mx-140">
          <div id="jumbotron" class="jumbotron mb-0 p-38 rounded-0">
            <!-- Card image -->
            <div class="view overlay text-center">
              <img src="storage/emailconfirmationhint.svg" id="illustrator" class="img-fluid mt-39" alt="Email Confirmation Hint Illustration">
            </div>

            <!-- Card content -->
              <div id="card-content" class="card-title mb-0">

                <!-- Title -->
                <h1 id="thank-you" class="card-title my-4 text-white text-center"><strong>Thank You!</strong></h1>
                <!-- Text -->
                <p id="confirmation-email" class="card-text text-white text-center mt-4 mb-4 mx-5">We will send you a confirmation e-mail shortly with an activation link to get you started with kitajoin.</p>
                <!-- Button -->
                <div class="text-center">
                  <router-link :to="{ name: 'login' }" id="gotologin" class="btn btn-1 btn-lg px-5 text-white">
                    Return to log in
                  </router-link>
                </div>
              </div>
            </div>

            <!-- Text -->
            <div id="send-again-container" class="background-color-white text-center text-black py-38 border border-black">
              <p id="see" class="mb-0">Didn't see it?</p>
              <p id="spam" class="mb-0">Check your spam for an e-mail from <span class="font-weight-bold">KITAJOIN</span></p>
              <p id="send-again" class="mb-0">or <span><a class="text-1 font-weight-bold" href="#" @click="resend()">send again</a></span></p>
            </div>
          </div>
        <div id="register-card" v-else class="border-0 mx-auto card-body background-color-white" style="max-width: 500px">
          <div class="d-block d-sm-none mt-5 mb-5">
            <h1 class="text-black">KITA <br /> JOIN</h1>
            <p class="text-black font-weight-light">Help you find the right team</p>
          </div>
          <div class="d-none d-sm-block d-sm-none d-md-block text-center">
            <img src="/png/logo.png" id="logo-image" class="img-fluid w-88 mt-39" alt="Logo">
            <p class="mt-3 mb-0 text-secondary font-weight-light">Join to KITAJOIN you will get the best people for your team.</p>
          </div>
          <hr class="mt-3 border-black">
          <form class="mt-4" @submit.prevent="register" @keydown="form.onKeydown($event)">
            <!-- Name -->
            <div class="input-card card-body">
              <div class="form-group row">
                <div class="col-md col-sm border border-black rounded">
                  <label for="fullName" class="card-title text-black">Full Name <span class="text-danger">*</span></label>
                  <input id="fullName" v-model="form.name" :class="{ 'is-invalid': form.errors.has('name') }" class="form-control" type="text" name="name">
                  <has-error :form="form" field="name" class="alert alert-danger" />
                </div>
              </div>
            </div>

            <!-- Email -->
            <div class="input-card card-body mt-3">
              <div class="form-group row">
                <div class="col-md col-sm border border-black rounded">
                  <label for="email" class="card-title text-black">Email <span class="text-danger">*</span></label>
                  <input id="email" v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control" type="email" name="email">
                  <has-error :form="form" field="email" class="alert alert-danger" />
                </div>
              </div>
            </div>

            <!-- Password -->
            <div class="input-card card-body mt-3">
              <div class="form-group row">
                <div class="col-md col-sm border border-black rounded">
                  <label for="password" class="card-title text-black">Password <span class="text-danger">*</span></label>
                  <input id="password" v-model="form.password" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control" type="password" name="password">
                  <has-error :form="form" field="password" class="alert alert-danger" />
                </div>
              </div>
            </div>

            <div class="form-group row mt-5">
              <div class="col-md col-sm">
                <!-- Submit Button -->
                <v-button :loading="form.busy" class="background-color-1 border-0">
                  Join
                </v-button>

                <!-- GitHub Register Button -->
                <login-with-github />
              </div>
            </div>
          </form>
          <ul id="already-have-an-account" class="list-inline text-center">
            <li class="list-inline-item">
                <p class="text-black">Already have an account?</p>
            </li>
            <li class="list-inline-item">
              <router-link id="sign-in-here" :to="{ name: 'login' }" class="nav-link text-secondary font-weight-bold" active-class="active">
                {{ $t('Sign in here') }}
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
  @media(max-width: 1000px) {
    .container {
      padding-left: 17px;
      padding-right: 17px;
    }
  }
</style>

<style scoped>
  input {
    outline: 0;
    border-width: 0 0 0px;
    padding: 0;
    -webkit-text-fill-color: black;
    font-weight: bold;
  }

  input:focus {
    box-shadow: none !important;
  }

  input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
  }

  #sign-in-here {
    color: #F38704;
    padding-left: 0;
  }

  #already-have-an-account {
    font-size: 12px;
    font-weight: lighter;
  }

  hr {
    border-top: 1px solid #B1C1C8;
  }

  label {
    color: #B1C1C8;
    font-size: 12px;
    margin: 0;
  }

  .input-card {
    background-color: white;
    border-radius: 4px;
    padding-top: 4px;
    padding-bottom: 0;
  }

  #register-card {
    padding: 0;
  }

  #register-container {
    height: calc(100vh - 56px);
  }  

  #kita-join-header{
    font-size: 8vw;
  }

  #kita-join-paragraph {
    font-size: 3vw;
  }

  .list-inline-item {
    margin-right: 0;
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

  #jumbotron {
      background-color: black;
  }

  #illustrator {
      width: 188px;
  }

  #container {
      padding: 17px 0;
  }

  #gotologin {
      border-radius: 4px;
      font-size: 1.5rem;
  }

  .card-title p {
      font-size: 0.75rem
  }

  .background-color-white {
    background-color: white;
  }

  .background-color-black {
    background-color: black;
  }

  .background-color-1 {
    background-color: #F7AB4F;
  }

  .border-black {
    border-color: black !important;
  }

  .text-black {
    color: black;
  }

  .text-1 {
    color: #F38704;
  }

  .mx-140 {
    margin-left: 140px;
    margin-right: 140px;
  }

  .mb-52 {
    margin-bottom: 60px;
  }

  .w-88 {
    width: 88px;
  }

  .btn-1 {
    background-color: #F38704;
  }

  .py-38 {
    padding-top: 38px;
    padding-bottom: 38px;
  }

  #thank-you {
    font-size: 3rem;
  }

  #confirmation-email, #see, #spam, #send-again {
    font-size: 1rem;
  }

  @media (max-width: 1000px) {
    .background-color-black {
      background-color: black;
    }

    .p-38 {
      padding: 38px;
    }

    .mt-39 {
      margin-top: 39px;
    }

    #send-again-container {
      font-size: 0.75rem;
    }

    #container {
      margin-left: 0;
      margin-right: 0;
    }

    #card-content {
      margin-top: 0 !important;
    }

    #thank-you {
      padding-top: 0 !important;
      font-size: 28px;
    }

    #confirmation-email {
      margin-left: 16px !important;
      margin-right: 16px !important;
      margin-bottom: 24px !important;
    }

    #confirmation-email, #see, #spam, #send-again {
      font-size: 12px;
    }

    #gotologin {
      padding-top: 11px;
      padding-bottom: 11px;
      font-size: 16px;
    }
  }
</style>

<script>
import Form from 'vform'
import LoginWithGithub from '~/components/LoginWithGithub'
import axios from 'axios'

export default {
  middleware: 'guest',

  components: {
    LoginWithGithub
  },

  metaInfo () {
    return { title: this.$t('register') }
  },

  data: () => ({
    form: new Form({
      name: '',
      email: '',
      password: '',
      password_confirmation: ''
    }),
    mustVerifyEmail: false,
    user: ''
  }),

  methods: {
    async register () {
      // Register the user.
      const { data } = await this.form.post('/api/register')

      // Must verify email fist.
      if (data.status) {
        this.mustVerifyEmail = true;
        this.user = await axios.post('/api/registerid/get/' + this.form.email);
      } else {
        // Redirect home
        this.$router.push({ name: 'home' })
      }
    },

    resend() {
      this.form.post('/api/email/resend')
    }
  }
}
</script>
