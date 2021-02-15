<template>
  <div class="w-100">
      <div id="verification-status-container" class="row">
        <div id="template-container-2" class="col my-auto">
          <card id="template-container" class="border-0">
            <template v-if="success">
              <div id="container">
                <div id="jumbotron" class="jumbotron p-0 mb-0">
                  
                  <!-- Card content -->
                  <div class="card-title mb-0">

                    <!-- Image -->
                    <div class="d-none d-sm-block d-sm-none d-md-block text-center">
                      <img class="w-304" src="/svg/undraw_verified_tw20.svg" alt="Verified Illustration">
                    </div>

                    <!-- Title -->
                    <h3 id="verified" class="card-title mt-5 mb-4 text-center"><strong>Verified!</strong></h3>
                    
                    <!-- Text -->
                    <p id="yahoo" class="card-text text-secondary text-center mt-4">Yahoo! You have successfully verified the account.</p>
                    
                    <div id="login-container" class="mt-5 text-center">
                      <!-- Button -->
                      <router-link id="login" class="btn btn-lg py-2 px-52 background-color-1 text-white" :to="{ name: 'login' }">
                          Go to Log In
                      </router-link>
                    </div>
                  </div>
                </div>
              </div>
            </template>
            <template v-else>
              <div id="container">
                <div id="jumbotron" class="p-0 mb-0 background-color-white">
                  
                  <!-- Card content -->
                  <div class="card-title mb-0">
                    <!-- Image -->
                    <div class="d-none d-sm-block d-sm-none d-md-block text-center">
                      <img class="w-203" src="/svg/undraw_access_denied_6w73.svg" alt="Expired Illustration">
                    </div>

                    <!-- Title -->
                    <h2 id="expired" class="card-title mt-4 mb-4 text-center"><strong>Expired!</strong></h2>
                    
                    <!-- Text -->
                    <p id="sorry" class="card-text text-secondary text-center mt-4 mx-236 mb-5">Sorry! The verification link is invalid. We will send you a <span id="verification-link-text">verification link</span> on this email</p>
                    
                    <form @submit.prevent="send" @keydown="form.onKeydown($event)">

                      <!-- Email -->
                      <div id="form-email" class="form-group">
                        <div class="text-center">
                          <label id="enter-email-label" class="col-md-3 text-1 p-0">Enter Email</label>
                        </div>
                        <div id="email-input-container" class="p-236">
                          <input v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control text-center font-weight-bold" type="email" name="email">
                          <hr class="mt-0 border-black">
                          <has-error :form="form" field="email" />
                        </div>
                      </div>

                      <!-- Submit Button -->
                      <div id="form-button" class="text-center">
                        <!-- Button -->
                        <button id="resend" class="btn btn-dark btn-lg py-2 px-52 background-color-1 border-0" type="submit">
                            Send
                        </button>
                      </div>
                      <alert-success id="success-alert" class="mt-5 mx-236 mb-0 alert-dark" :form="form" message="We have sent your verification link!" />
                    </form>
                  </div>
                </div>
              </div>
            </template>
          </card>
        </div>
      </div>
  </div>
</template>

<style scoped>
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

  .mx-236 {
    margin-left: 236px;
    margin-right: 236px;
  }

  .border-black {
    border-color: black;
  }

  .w-203 {
    width: 203px;
  }

  .w-304 {
    width: 304px;
  }

  .p-236 {
    padding-left: 236px;
    padding-right: 236px;
  }

  .px-52 {
    padding-left: 108px;
    padding-right: 108px;
  }

  .text-1 {
    color: #F38704;
  }

  .background-color-1 {
    background-color: #F38704;
  }

  input {
    outline: 0;
    border-width: 0 0 0px;
    padding: 0;
    -webkit-text-fill-color: black;
  }

  input:focus{
    box-shadow: none !important;
  }

  #verification-status-container {
    height: calc(100vh - 56px);
  }

  #resend, #login {
    font-size: 1.25rem;
    border-radius: 4rem !important;
  }

  #expired, #sorry, #verified, #yahoo {
    font-size: 1.5rem;
  }

  input:-webkit-autofill,
  input:-webkit-autofill:hover, 
  input:-webkit-autofill:focus, 
  input:-webkit-autofill:active  {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
    border-radius: 0;
  }

  #jumbotron {
    background-color: white;
  }
  
  @media screen and (max-width: 1000px) {
    card {
      padding: 86px 27px;
    }

    #gotologin {
        border-radius: 4px;
        font-size: 1rem;
    }

    .card-title p {
        font-size: 1rem
    }

    .row {
      margin-top: 36px;
    }

    .row > div {
      padding: 0 36px;
    }

    #container {
      margin: 21px;
    }

    #template-container {
      border: 1px black solid !important;
      border-radius: 4px;
    }

    #template-container-2 {
      margin-top: 0 !important;
      margin-bottom: 0 !important;
    }

    .btn {
      font-size: 1rem;
    }

    #enter-email-label {
      margin-bottom: 0;
      font-size: 14px;
    }

    #form-email {
      margin-bottom: 46px;
    }

    #expired, #verified {
      margin-top: 0 !important;
      font-size: 28px;
    }

    #sorry, #yahoo{
      margin-left: 0;
      margin-right: 0;
      font-size: 16px;
    }

    #email-input-container {
      padding-left: 0;
      padding-right: 0;
    }

    #login-container {
      margin-top: 0px !important;
      padding-top: 8px;
    }

    #resend, #login {
      display: block;
      width: 100%;
      border-radius: 4px !important;
      padding-left: 0;
      padding-right: 0;
      font-size: 16px;
      font-weight: bold;
    }

    #success-alert {
      margin-left: 0;
      margin-right: 0;
    }
  }
</style>

<script>
import axios from 'axios'
import Form from 'vform'

const qs = (params) => Object.keys(params).map(key => `${key}=${params[key]}`).join('&')

export default {
  middleware: 'guest',

  metaInfo () {
    return { title: this.$t('verify_email') }
  },

  async beforeRouteEnter (to, from, next) {
    try {
      const { data } = await axios.post(`/api/email/verify/${to.params.id}?${qs(to.query)}`)

      next(vm => { vm.success = data.status })
    } catch (e) {
      next(vm => { vm.error = e.response.data.status })
    }
  },

  data: () => ({
    error: '',
    success: '',
    status: false,
    form: new Form({
      email: ''
    })
  }),

  methods: {
    async send() {
      const { data } = await this.form.post('/api/email/resend')

      this.status = data.status

      this.form.reset()
    }
  },

  created() {
    if (this.$route.query.email) {
      this.form.email = this.$route.query.email
    }
  }
}
</script>
