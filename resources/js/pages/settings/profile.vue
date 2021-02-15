<template>
  <div>
    <div id="not-available" class="d-none d-sm-block d-sm-none d-md-block">
      <div id="not-available-container" class="bg-white text-center pt-3 pb-3">
        <fa id="laptop" icon="laptop"></fa>
        <h1 id="oops" class="font-weight-normal">Oops!</h1>
        <p class="mt-4 font-weight-normal">Sorry, we're only available in mobile right now. We'll let you know as soon as we are!</p>
      </div>
    </div>
    <card id="profile-card" class="my-3 mx-1 background-color-black d-block d-sm-none d-none d-sm-block d-md-none">
      <form @submit="update" @keydown="form.onKeydown($event)" method="POST" enctype="multipart/form-data">
        <alert-success :form="form" :message="$t('info_updated')" />

        <div class="form-group row mt-1 mb-0">
          <div class="col">
            <img id="user-photo" class="rounded-circle" :src="person.image" alt="User image">
          </div>
        </div>

        <div class="form-group row mt-24 mb-0">
          <a id="change-photo" class="text-white" href="#" data-toggle="modal" data-target="#modal-user-photo">
            Change photo
          </a>
        </div>

        <div id="modal-user-photo" class="modal" role="dialog">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Change photo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div>
                  <input id="image-input" type="file" class="form-control-file" @change="onFileChange" name="image">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- About -->
        <div class="row mt-19">
          <label id="about-label" class="col col-form-label font-weight-bold py-0 px-3 text-white">About</label>
        </div>
        <div class="form-group row mt-12 mb-0">
          <div class="col px-3">
            <textarea v-model="person.bio" id="about-textarea" :class="{ 'is-invalid': form.errors.has('about') }" class="form-control background-color-black" name="bio"></textarea>
            <has-error :form="form" field="about" />
          </div>
        </div>

        <hr class="border-white mt-28 mb-0">

        <!-- Telephone -->
        <div class="row mt-24">
          <label id="telephone-label" class="col-md-3 col-form-label font-weight-bold pt-0 pb-0 text-white">Telephone <span class="text-danger">*</span></label>
        </div>
        <div class="form-group row mb-0">
          <div class="col input-group">
            <div id="telephone-62" class="input-group-addon my-auto text-white">+62</div>
            <input v-model="person.contact" id="telephone-input" :class="{ 'is-invalid': form.errors.has('telephone') }" class="form-control background-color-black" type="tel" name="contact" required>
            <has-error :form="form" field="telephone" />
          </div>
        </div>

        <hr class="border-white mb-0">

        <!-- Interest -->
        <div class="row mt-24">
          <label id="interest-label" class="col-md-3 col-form-label font-weight-bold pt-0 pb-0 text-white">Interest <span class="text-danger">*</span></label>
        </div>
        <div class="form-group row">
          <div class="col">
            <input v-model="person.interest" id="interest-input" :class="{ 'is-invalid': form.errors.has('interest') }" class="form-control background-color-black" type="text" name="interest" required>
            <has-error :form="form" field="interest" />
          </div>
        </div>

        <hr class="mb-0 border-white">

        <!-- Submit Button -->
        <div class="row mt-24">
          <div class="col-md col-sm">
            <v-button :loading="form.busy" class="background-color-1">
              Save
            </v-button>
          </div>
        </div>
      </form>
    </card>
  </div>
</template>

<style scoped>
  #user-photo {
    width: 140px;
    height: 140px;
    margin: auto;
    display: block;
  }

  #change-photo {
    margin: 0 auto;
    color: #B1C1C8;
  }

  input, textarea {
    outline: 0;
    border-width: 0 0 0px;
    padding: 0;
  }

  input:focus, textarea:focus {
    box-shadow: none !important;
  }

  .background-color-black {
    background-color: black;
  }

  .mt-12 {
    margin-top: 12px;
  }

  .mt-19 {
    margin-top: 19px;
  }

  .mt-24 {
    margin-top: 24px;
  }

  .mt-28 {
    margin-top: 28px;
  }

  .border-white {
    border-color: white;
  }

  #about-textarea, #telephone-input, #interest-input {
    -webkit-text-fill-color: white;
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

  .background-color-1 {
    background-color: #F38704;
  }

  @media (max-width: 1000px) {
    #change-photo, #about-label, #about-textarea, #telephone-label, #telephone-62, #telephone-input, #interest-label, #interest-input {
      font-size: 0.825rem;
    }
  }

  @media (min-width: 768px) {
    .card {
      margin-top: 3vh !important;
    }
  }
</style>

<script>
import Form from 'vform'
import { mapGetters } from 'vuex'
import axios from 'axios'

export default {
  scrollToTop: false,

  metaInfo () {
    return { title: this.$t('settings') }
  },

  data: () => ({
    form: new Form({
      id: '',
      about: '',
      telephone: '',
      interest: ''
    }),
    image: ''
  }),

  computed: mapGetters({
    user: 'auth/user',
    person: 'person'
  }),

  created () {
    // Fill the form with user data.
    this.form.keys().forEach(key => {
      this.form[key] = this.user[key]
    })
  },

  mounted() {
    this.$store.dispatch('fetchPerson', {
      id: this.form.id
    })
  },

  methods: {
    update(e) {
      e.preventDefault();
      let currentObj = this;

      const config = {
        headers: {'content-type': 'multipart/form-data'}
      }

      let formData = new FormData();
      var imageInput = document.getElementById('image-input');
      if (imageInput.files.length != 0) {
        formData.append('image', this.image);
      }
      if (this.person.bio === null) {
        formData.append('bio', '');
      } else {
        formData.append('bio', this.person.bio);
      }
      formData.append('contact', this.person.contact);
      formData.append('interest', this.person.interest);

      axios.post('/api/update/' + this.person.id, formData, config).then(function (response) {
        currentObj.success = response.data.success;
      }).catch(function (error) {
        currentObj.output = error;
      });

      this.$router.go();
    },
    onFileChange(e) {
      console.log(e.target.files[0]);
      this.image = e.target.files[0];
      this.person.image = URL.createObjectURL(this.image);
    }
  }
}
</script>
