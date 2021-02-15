<template>
  <div class="w-100">
    <div>
      <div id="login-container" class="row">
        <div class="col-sm col-md my-auto">
          <div id="login-card" class="border-0 mx-auto card-body background-color-white" style="max-width: 500px; margin:">
            <div class="d-none d-sm-block d-sm-none d-md-block">
              <img src="/png/logo.png" id="logo-image" class="img-fluid w-124 mt-39" alt="Logo">
            </div>
            <div id="login-register" class="mt-52">
              <h2 id="login" class="font-weight-bold d-inline">Log In</h2>
              <router-link id="register" class="d-none d-sm-inline d-sm-none d-md-inline ml-3 text-1 font-weight-bold" :to="{ name: 'register' }">
                Register
              </router-link>
            </div>
            <form class="mt-5" @submit.prevent="login" @keydown="form.onKeydown($event)">
              <!-- Email -->
              <div class="input-card card-body mb-3">
                <div class="form-group row">
                  <div class="col-md col-sm border border-black rounded">
                    <label for="email" class="card-title text-black">Email <span class="text-danger">*</span></label>
                    <input id="email" v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control" type="email" name="email">
                    <has-error :form="form" field="email" class="alert alert-danger"/>
                  </div>
                </div>
              </div>

              <!-- Password -->
              <div class="input-card card-body">
                <div class="row">
                  <div class="col-md col-sm border border-black rounded">
                    <label for="password" class="text-black">Password <span class="text-danger">*</span></label>
                    <input id="password" v-model="form.password" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control" type="password" name="password">
                    <has-error :form="form" field="password" class="alert alert-danger"/>
                  </div>
                </div>
              </div>
              
              <div class="mt-4 form-group row">
                <div class="col-md col-sm">
                  <!-- Submit Button -->
                  <v-button :loading="form.busy" class="background-color-black">
                    Let's find
                  </v-button>
                  
                  <!-- GitHub Login Button -->
                  <login-with-github />
                </div>
              </div>
              <div class="d-block d-sm-none d-none d-sm-block d-md-none mt-3 pt-5 text-center">
                <router-link :to="{ name: 'register' }"><u class="background-color-white text-1">Register</u></router-link>
              </div>
            </form>
          </div>
        </div>
        <div class="col-sm col-md d-none d-xl-block my-auto px-auto">
          <img class="w-525 float-right" alt="Log In Illustration" src="/svg/undraw_Login_v483.svg">
        </div>
      </div>
    </div>
  </div>
</template>

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

  #login-card {
    padding: 0;
  }

  label {
    color: #B1C1C8;
    font-size: 12px;
    margin: 0;
  }

  .input-card {
    background-color: white;border-radius: 4px;
    padding-top: 4px;
    padding-bottom: 0;
  }

  #login-container {
    height: calc(100vh - 56px);
  }  

  #forgot-password {
    color: #9e9e9e;
  }
  
  #kita-join-header{
    font-size: 8vw;
  }

  #kita-join-paragraph {
    font-size: 3vw;
  }

  #register-button {
    background-color: black;
    border-color: black;
  }

  #register-button:focus, #register-button:active {
    outline: none !important;
    box-shadow: none;
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

  .background-color-white {
    background-color: white;
  }

  .background-color-black {
    background-color: black;
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

  .w-124 {
    width: 124px;
  }

  .w-525 {
    width: 405px;
  }

  .mt-52 {
    margin-top: 80px;
  }

  #register {
    font-size: 1.25rem;
  }

  @media (max-width: 1000px) {
    #login-register {
      margin-top: 0;
    }

    #login {
      font-size: 2.5rem;
    }
  }
</style>

<script>
import Form from 'vform'
import LoginWithGithub from '~/components/LoginWithGithub'
import VueSocialAuth from 'vue-social-auth'

export default {
  middleware: 'guest',

  components: {
    LoginWithGithub
  },

  metaInfo () {
    return { title: this.$t('login') }
  },

  data: () => ({
    form: new Form({
      email: '',
      password: ''
    }),
    remember: false
  }),

  methods: {
    async login () {
      // Submit the form.
      const { data } = await this.form.post('/api/login')

      // Save the token.
      this.$store.dispatch('auth/saveToken', {
        token: data.token,
        remember: this.remember
      })

      // Fetch the user.
      await this.$store.dispatch('auth/fetchUser')

      // Redirect home.
      this.$router.push({ name: 'home' })
    },
    AuthProvider(provide) {
      var self = this
      this.$auth.authenticate(provider).then(response => {
        self.SocialLogin(provider, response)
      }).catch(err => {
        console.log({err:err})
      })
    },
    SocialLogin(provide, response) {
      this.$http.post('/sociallogin/' + provider, response).then(response => {
        console.log(response.data)
      }).catch(err => {
        console.log({err:err})
      })
    }
  }
}
</script>
