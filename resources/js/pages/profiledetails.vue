<template>
    <div>
        <div id="not-available" class="d-none d-sm-block d-sm-none d-md-block">
            <div id="not-available-container" class="bg-white text-center pt-3 pb-3">
                <fa id="laptop" icon="laptop"></fa>
                <h1 id="oops" class="font-weight-normal">Oops!</h1>
                <p class="mt-4 font-weight-normal">Sorry, we're only available in mobile right now. We'll let you know as soon as we are!</p>
            </div>
            </div>
            <div class="pt-3 pb-28 px-17 d-block d-sm-none d-none d-sm-block d-md-none">
                <card id="general-profile" class="mt-12 background-color-black">
                    <div class="d-flex">
                        <img :src="person.image" class="rounded-circle img-responsive my-auto d-block d-sm-none" width="75" height="75" :alt="person.name + 'image'">
                        <img :src="person.image" class="rounded-circle img-responsive my-auto d-none d-sm-block" width="auto" height="130" :alt="person.name + 'image'">
                        <div id="profile-identity" class="my-auto">
                            <h4 class="text-white">{{ person.name }}</h4>
                            <div v-if="person.program !== 'Empty'">
                                <h6 id="user-study-program" class="text-white" v-if="user.id === person.id">{{ person.program }}</h6>
                                <h6 id="study-program" class="text-white" v-else>{{ person.program }}</h6>
                            </div>
                            <div class="d-flex">
                                <button type="button" class="btn btn-dark d-none d-sm-block mr-2" data-toggle="modal" data-target="#contact-information-modal">
                                    Contact information
                                </button>
                                <router-link :to="{name: 'settings.profile', params: {id: person.id}}" tag="button" class="btn btn-1 btn-sm text-white" v-if="user.id === person.id">
                                    Edit Profile
                                </router-link>
                            </div>
                        </div>
                        <div id="contact-information-modal" class="modal" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title font-weight-light">{{ person.name }}</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <h6 id="contact-information" class="font-weight-light mb-4">Contact Information</h6>
                                        <div class="d-flex">
                                            <fa icon="address-book" class="mr-4 fa-2x my-auto"/>
                                            <div>
                                                <h6 id="telephone" class="font-weight-bold mb-0 telephone">Telephone</h6>
                                                <p id="telephone-number" class="mb-0">+62{{ person.contact }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="person.contact !== 'Empty' && user.id !== person.id" class="text-center mt-4">
                        <a :href="'https://wa.me/62' + person.contact" id="whatsapp-anchor" class="btn fa-whatsapp text-white font-weight-bold">
                            <fa :icon="['fab', 'whatsapp']" />
                            WhatsApp
                        </a>
                    </div>
                </card>
                <card class="mt-12 border-black py-9 px-17" v-if="person.bio !== null">
                    <div>
                        <h6 id="about" class="text-black font-weight-bold">About</h6>
                        <p id="about-value" class="mt-3 mb-0 text-1">{{ person.bio }}
                        </p>
                    </div>
                </card>
                <card class="mt-12 border-black py-9 px-17">
                    <div>
                        <h6 id="interest" class="mb-4 text-black font-weight-bold">Interest</h6>
                        <ul class="list-unstyled mb-0">
                            <li v-if="person.interest === ''" id="null-interest" class="medium-light-semibold bg-secondary d-inline-flex">-</li>
                            <li v-else id="interest-value" class="medium-light-semibold bg-secondary d-inline-flex">{{ person.interest }}</li>
                        </ul>
                    </div>
                </card>
                <card class="d-block d-sm-none mt-12 border-black py-9 px-17" v-if="person.contact !== null">
                    <div class="mb-4">
                        <h6 id="contact" class="text-black font-weight-bold">Contact</h6>
                    </div>
                    <div class="d-flex">
                        <fa icon="address-book" class="fa-3x my-auto d-none d-sm-block"/>
                        <fa icon="address-book" class="fa-2x my-auto d-block d-sm-none"/>
                        <div class="ml-20">
                            <h6 id="telephone-header" class="font-weight-bold mb-0 telephone">Telephone</h6>
                            <p v-if="person.contact === ''" class="mb-0 text-1">-</p>
                            <p v-else class="mb-0 text-1">+62{{ person.contact }}</p>
                        </div>
                    </div>
                </card>
            </div>
    </div>
</template>

<style scoped>
    h4, .telephone{
        color: black;
    }

    h4 {
        font-size: 5.5vw;
    }

    #profile-identity {
        margin-left: 6vw;
    }

    .mt-12 {
        margin-top: 12px;
    }

    .ml-20 {
        margin-left: 20px;
    }

    .px-17 {
        padding-left: 17px;
        padding-right: 17px;
    }

    .background-color-black {
        background-color: black !important;
    }

    .btn-1 {
        background-color: #8C8B8B;
    }

    .border-black {
        border-color: black;
    }

    .py-9 {
        padding-top: 9px;
        padding-bottom: 9px;
    }

    .pb-28 {
        padding-bottom: 28px;
    }

    text-black {
        color: black !important;
    }

    .text-1 {
        color: #8C8B8B !important;
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

    @media (max-width: 1000px) {
        #about-value, #interest-value, #null-interest, #telephone-header, #user-study-program, #study-program {
            font-size: 0.825rem !important;
        }

        #whatsapp-anchor {
            border-radius: 0.75rem;
            font-size: 0.825rem;
        }
    }

    @media (min-width: 768px) {
        #general-profile {
            margin-top: 43px;
        }

        h4 {
            font-size: 4.5vw;
        }

        h6 {
            font-size: 3vw;
        }

        #profile-identity {
            margin-left: 3vw;
        }

        #study-program {
            margin-bottom: 24px;
        }
    }

    .card {
        padding: 12px;
        border-radius: 12px;
    }

    li {
        color: white;
        padding: 8px;
        border-radius: 14px;
    }

    .scl-btn {
      padding-top: 5px;
      padding-bottom: 5px;
      padding-left: 11px;
      padding-right: 11px;
      font-size: 25px;
      width: 55px;
      text-align: center;
      margin:5px;
      color: white;
    }
    
    /* Hover Effect */
    .scl-btn:hover {
      opacity: 0.8;
      text-align: center;
      text-decoration: none;
      color: white;
    }

    .fa-whatsapp { background: #25D366; }

    @media (min-width: 1024px) {
        #contact-information, #telephone {
            font-size: 2vw;
        }
    }

    @media (max-width: 414px) {
        #interest, #contact, #about {
            font-size: 5vw;
        }

        #user-study-program {
            margin-bottom: 2vh;
        }
    }
</style>

<script>
import { mapGetters } from 'vuex';

export default {
    mounted() {
        this.$store.dispatch('fetchPerson', {
            id: this.$route.params.id
        }),
        this.$store.dispatch('fetchUser')
    },
    computed: {
        ...mapGetters([
            'person',
            'user'
        ])
    }
}
</script>
