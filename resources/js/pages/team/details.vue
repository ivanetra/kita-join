<template>
    <div>
        <div id="not-available" class="d-none d-sm-block d-sm-none d-md-block">
            <div id="not-available-container" class="bg-white text-center pt-3 pb-3">
                <fa id="laptop" icon="laptop"></fa>
                <h1 id="oops" class="font-weight-normal">Oops!</h1>
                <p class="mt-4 font-weight-normal">Sorry, we're only available in mobile right now. We'll let you know as soon as we are!</p>
            </div>
        </div>
        <div class="d-block d-sm-none d-none d-sm-block d-md-none py-3 px-13">
            <card id="general-profile" class="background-color-black">
                <div>
                    <div id="profile-identity" class="my-auto text-center">
                        <h4 class="mb-0 text-white">{{ team.post_name }}</h4>
                        <router-link :to="{name: 'update.team', params: {id: team.id}}" tag="button" class="btn btn-1 btn-sm mt-2 text-white" v-if="team.user_id === user.id">
                            Edit Team
                        </router-link>
                    </div>
                </div>
            </card>
            <card class="mt-12 py-9 px-20 border-black">
                <div>
                    <h5 id="about" class="mb-3 text-black font-weight-bold">Team description</h5>
                    <p id="team-description-paragraph" class="mb-0 text-1"> {{ team.description }} </p>
                    <hr class="mt-26 mb-0 border-black">
                    <h6 id="contest-category" class="mt-26 mb-1 font-weight-bold">Contest category</h6>
                    <p class="mb-0 text-1"> {{ team.category }} </p>
                </div>
            </card>
            <card class="mt-12 py-9 px-20 border-black">
                <div class="d-flex mb-3">
                    <h6 v-if="team.user_id === user.id" id="interest" class="mb-4  mr-auto my-auto text-black font-weight-bold">Request</h6>  
                    <h6 v-else id="interest" class="mb-4 font-weight-light mr-auto my-auto">Members</h6>  
                    <div v-if="team.user_id !== user.id">
                        <input v-if="joinStatus === 'null' && team.user_id !== user.id" id="join-button" class="btn font-weight-bold pr-0" type="button" value="JOIN" @click="join()"/>
                        <input v-else-if="joinStatus.join_status === 0" id="requested-button" class="btn font-weight-bold pr-0" type="button" value="REQUESTED" @click="unjoin(id)"/>
                        <input v-else id="requested-button" class="btn font-weight-bold pr-0" type="button" value="JOINED" @click="unjoin(id)"/>
                    </div>
                </div>
                <div v-if="team.user_id !== user.id" class="mt-2">
                    <div class="d-flex">
                        <img :src="person.image" class="rounded-circle img-responsive my-auto" width="75" height="75" :alt="person.name + 'image'">
                        <div id="profile-identity" class="my-auto ml-2">
                            <router-link id="person-name" :to="{ name: 'profile.details', params: {id: person.id}}" class="navbar-brand font-weight-bold">
                                {{ person.name }}
                            </router-link>
                            <p v-if="person.program === 'Empty'" id="person-interest" class="mb-0"></p>
                            <p v-else id="person-interest" class="mb-0">{{ person.program}}</p>
                        </div>
                    </div>
                </div>
                <div v-if="requests !== 'null'">
                    <div v-for="request in requests" v-if="request.join_status !== 0 || team.user_id === user.id" class="d-flex mb-10" >
                        <img :src="request.image" class="rounded-circle img-responsive my-auto" width="76" height="76" :alt="person.name + 'image'">
                        <div id="profile-identity" class="my-auto ml-12">
                            <router-link id="person-name" :to="{ name: 'profile.details', params: {id: request.user_id}}" class="navbar-brand pt-0 font-weight-bold">
                                {{ request.name }}
                            </router-link>
                            <div v-if="team.user_id === user.id" class="d-flex">
                                <button v-if="request.join_status === 0" type="button" class="btn btn-secondary btn-sm btn-block mr-2" @click="confirm(request.user_id)">Confirm</button>
                                <button v-else type="button" class="btn btn-secondary btn-sm btn-block mr-2" @click="deleteRequest(request.user_id)">Delete</button>                        
                            </div>
                            <p v-else-if="request.program === 'Empty'" id="person-interest" class="mb-0">-</p>
                            <p v-else id="person-interest" class="mb-0">{{ request.program}}</p>
                        </div>
                    </div>
                </div>
                <p v-else-if="team.user_id === user.id" id="no-request-paragraph" class="mb-0">No Requests</p>
            </card>
            <card v-if="team.user_id === user.id" class="mt-12 mb-3 border-black">
                <h6 id="dangerous-area" class="mb-4 text-black font-weight-bold">Dangerous area</h6>
                <input class="btn btn-secondary btn-lg btn-block text-left font-weight-bold" type="button" value="Delete team" @click="deleteTeam()" />
            </card>
        </div>
    </div>
</template>

<style scoped>
    h4, .telephone{
        color: black;
    }

    #no-request-paragraph {
        font-size: 4vw;
    }

    #person-name {
        color: black;
    }

    #general-profile {
        margin-top: 2vh;
    }

    #join-button, #requested-button {
        -webkit-box-shadow: none!important;
        box-shadow: none!important;
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

    .mt-12 {
        margin-top: 12px;
    }

    .mt-26 {
        margin-top: 26px;
    }

    .mb-10 {
        margin-bottom: 10px;
    }

    .ml-12 {
        margin-left: 12px;
    }

    .border-black {
        border-color: black;
    }

    .py-9 {
        padding-top: 9px;
        padding-bottom: 9px;
    }

    .px-13 {
        padding-left: 13px;
        padding-right: 13px;
    }

    .px-20 {
        padding-left: 20px;
        padding-right: 20px;
    }

    .background-color-black {
        background-color: black;
    }

    .background-color-1 {
        background-color: #8C8B8B;
    }

    .btn-1 {
        background-color: #F38704;
    }

    .text-black {
        color: black;
    }

    .text-1 {
        color: #8C8B8B;
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

    @media (min-width: 1024px) {
        #contact-information, #telephone {
            font-size: 2vw;
        }
    }

    @media (max-width: 1000px) {
        #interest, #contact, #about, #dangerous-area {
            font-size: 5vw;
        }

        #user-study-program {
            margin-bottom: 2vh;
        }

        #team-description-paragraph, #contest-category {
            font-size: 0.75rem;
        }

        .navbar-brand {
            font-size: 1rem;
        }
    }
</style>

<script>
    import Form from 'vform'
    import { mapGetters } from 'vuex'; 
    import axios from 'axios'

    export default {
        
        data: () => ({
            form: new Form({}),
            id: {
                user_id: null,
                post_id: null
            },
            requestId: {
                user_id: null,
                post_id: null
            }
        }),

        mounted() {
            this.id.user_id = this.user.id,
            this.id.post_id = this.$route.params.id,
            this.$store.dispatch('fetchTeam', {
                id: this.$route.params.id
            }),
            this.$store.dispatch('fetchPerson', {
                id: this.$route.params.user_id
            }),
            this.$store.dispatch('fetchRequests', {
                post_id: this.$route.params.id
            }),
            this.$store.dispatch('fetchUser'),
            this.$store.dispatch('fetchJoinStatus', this.id)
        },

        computed: mapGetters({
            user: 'auth/user',
            team: 'team',
            requests: 'requests',
            person : 'person',
            joinStatus: 'joinStatus'
        }),

        methods: {
            deleteTeam: function() {
                let currentObj = this;

                axios.delete('/api/post/delete/' + this.$route.params.id).then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.push({ name: 'team' });
            },

            join: function() {
                let currentObj = this;

                axios.post('/api/follow/' + this.team.id)
                .then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.go();
            },

            unjoin: function(id) {
                let currentObj = this;

                axios.delete('/api/joinstatus/delete/' + this.user.id + '/' + this.$route.params.id)
                .then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.go();
            },

            confirm: function(user_id) {
                let currentObj = this;

                this.requestId.user_id = user_id;
                this.requestId.post_id = this.$route.params.id;

                axios.post('/api/request/accept', this.requestId)
                .then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.go();
            },

            deleteRequest: function(user_id) {
                let currentObj = this;

                this.requestId.user_id = user_id;
                this.requestId.post_id = this.$route.params.id;

                axios.post('/api/request/delete', this.requestId)
                .then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.go();
            }
        }
    }
</script>