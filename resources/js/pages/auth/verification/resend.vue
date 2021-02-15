<template>
  <div class="w-100">
      <div id="resend-container" class="row">
        <div id="resend-container-3" class="col my-auto">
          <card id="resend-container-2" class="background-color-black mx-140">
            <div id="container">
              <div id="jumbotron" class="jumbotron p-0 mb-0 background-color-black">

                <!-- Card image -->
                <div id="card-image" class="view overlay mt-51 text-center">
                  <img src="/storage/emailconfirmationhint.svg" id="illustrator" class="img-fluid w-188" alt="Email Confirmation Hint Illustration">
                </div>

                <h1 id="email-verification" class="mt-4 text-center text-white font-weight-bold">Email Verification</h1>

                <!-- Text -->
                <p id="verification-link-text" class="card-text text-white text-center mt-3 mb-5">We will send you an <span class="text-1">Activation Link</span> to get you started with kitajoin.</p>

                <!-- Card content -->
                <div class="card-title mb-0">
                  <form @submit.prevent="send" @keydown="form.onKeydown($event)">

                    <!-- Email -->
                    <div id="form-email" class="form-group text-center">
                      <label id="enter-email-label" class="col-md-3 col-form-label text-center text-white font-weight-bold p-0">Enter Email</label>
                      <div id="email-input-container" class="mt-3 mx-101">
                        <input id="email-input" v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control font-weight-bold background-color-black text-center" type="email" name="email">
                        <hr class="mt-0 border-white">
                        <has-error :form="form" field="email" />
                      </div>
                    </div>

                    <!-- Submit Button -->
                    <div id="form-button" class="text-center">
                      <!-- Button -->
                      <button id="resend" class="btn btn-1 btn-lg px-53 mb-5 text-white font-weight-bold" type="submit">
                          GET LINK
                      </button>
                    </div>
                    <alert-success id="success-alert" class="alert-dark mx-101" :form="form" message="We have sent your verification link!" />
                  </form>
                </div>
              </div>
            </div>
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

  .background-color-black {
    background-color: black !important;
  }

  .text-1 {
    color: #F38704 !important;
  }

  .border-white {
    border-color: white;
  }

  .card {
    border-radius: 4px;
  }

  .mt-51 {
    margin-top: 51px;
  }

  .mx-101 {
    margin-left: 101px;
    margin-right: 101px;
  }

  .mx-140 {
    margin-left: 140px;
    margin-right: 140px;
  }

  .w-188 {
    width: 188px;
  }

  #resend-container {
    height: calc(100vh - 56px);
  }

  #email-verification {
    font-size: 50px;
  }

  input {
    outline: 0;
    border-width: 0 0 0px;
    padding: 0;
    -webkit-text-fill-color: white;
    background-color: black !important;
  }

  input:focus{
    box-shadow: none !important;
  }

  input:-webkit-autofill,
  input:-webkit-autofill:hover, 
  input:-webkit-autofill:focus, 
  input:-webkit-autofill:active  {
    -webkit-box-shadow: 0 0 0 30px black inset !important;
    border-radius: 0;
  }

  #success-alert {
    margin-bottom: 21px;
  }

  .btn-1 {
    background-color: #F38704;
  }

  .px-53 {
    padding-left: 53px;
    padding-right: 53px;
  }

  @media screen and (max-width: 1000px) {
    card {
      padding: 86px 27px;
    }

    #jumbotron {
        background-color: white;
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
      margin-bottom: 36px;
    }

    .row > div {
      padding: 0 36px;
    }

    #container {
      margin: 21px 17px;
    }

    .btn {
      font-size: 1rem;
      padding: 10px 16px;
    }

    #enter-email-label {
      font-size: 0.875rem;
    }

    #form-email {
      margin-right: 32px;
      margin-left: 32px;
      margin-bottom: 46px;
    }

    h1 {
      font-size: 1.25rem;
      margin: 76px 0 0 0;
    }

    img {
      width: 154px;
    }

    #verification-link-text {
      margin-top: 11px !important;
      font-size: 0.825rem;
    }

    #verification-link-text span {
      color: black;
    }

    #resend-container-2 {
      margin-left: 0;
      margin-right: 0;
    }

    #card-image {
      margin-top: 0;
    }

    #illustrator {
      width: 154px;
    }

    #email-verification {
      margin-top: 75px !important;
      font-size: 20px;
    }

    #email-input-container {
      margin-left: 0;
      margin-right: 0;
    }

    #resend-container {
      margin-bottom: 0;
    }

    #resend-container-3 {
      margin-top: 0 !important;
      margin-bottom: 0 !important;
    }

    #resend {
      margin-bottom: 0 !important;
      padding-left: 70px;
      padding-right: 70px;
    }
  }
</style>

<script>
import Form from 'vform'

export default {
  middleware: 'guest',

  metaInfo () {
    return { title: this.$t('verify_email') }
  },

  data: () => ({
    status: '',
    form: new Form({
      email: ''
    })
  }),

  created () {
    if (this.$route.query.email) {
      this.form.email = this.$route.query.email
    }
  },

  methods: {
    async send () {
      const { data } = await this.form.post('/api/email/resend')

      this.status = data.status

      this.form.reset()
    }
  }
}
</script>
