<template>
    <div>
        <div id="not-available" class="d-none d-sm-block d-sm-none d-md-block">
            <div id="not-available-container" class="bg-white text-center pt-3 pb-3">
                <fa id="laptop" icon="laptop"></fa>
                <h1 id="oops" class="font-weight-normal">Oops!</h1>
                <p class="mt-4 font-weight-normal">Sorry, we're only available in mobile right now. We'll let you know as soon as we are!</p>
            </div>
        </div>
        <div class="d-block d-sm-none d-none d-sm-block d-md-none mt-30 mx-1">
            <div v-if="teamsCreated.length || teamsJoined.length">
                <div id="header" class="row">
                    <div class="col my-auto">
                        <h5 class="mb-0 text-black">Teams</h5>
                    </div>
                    <div class="col">
                        <router-link id="create-button" class="text-black float-right p-0 border-0 background-color-white" :to="{name: 'create.team'}" tag="button">
                            <fa id="plus-icon" icon="plus"></fa>
                        </router-link>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-2">               
                        <card v-for="team in teamsCreated" v-bind:key="team.id" class="shadow-sm mb-3 background-color-black">
                            <div class="person-row ml-7">
                                <div class="my-auto overflow-hidden">
                                    <router-link id="team-name" :to="{name: 'team.details', params: { id: team.id, user_id: team.user_id }}" class="navbar-brand text-white font-weight-bold">
                                        {{ team.post_name }}
                                    </router-link>
                                </div>
                            </div>
                        </card>
                        <card v-for="team in teamsJoined" v-bind:key="team.id" class="shadow-sm mb-3 background-color-black">
                            <div class="person-row ml-7">
                                <div class="my-auto overflow-hidden">
                                    <router-link id="team-name" :to="{name: 'team.details', params: { id: team.id, user_id: team.user_id }}" class="navbar-brand text-white font-weight-bold">
                                        {{ team.post_name }}
                                    </router-link>
                                </div>
                            </div>
                        </card>
                    </div>
                </div>
            </div>
            <div v-else class="text-center">
                <img class="w-284" src="svg/undraw_no_data_qbuo.svg" alt="No Teams Illustration">
                <div class="mt-5">
                    <h4 class="font-weight-bold">No Team</h4>
                </div>
                <div class="mt-12">
                    <p class="text-secondary">There is no team at the moment</p>
                </div>
                <div class="mt-44">
                    <router-link class="btn btn-1 btn-circle btn-md" :to="{name: 'create.team'}" tag="button">
                        <fa id="add-button-icon" class="text-white" icon="plus"></fa>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
    #header {
        margin-top: 12px;
    }

    h5 {
        color: white;
    }

    #team-name {
        color: black;
    }

    .truncate {
        width: 250px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    #create-button {
        font-size: 6vw;
    }

    #create-button:focus, #create-button:active {
        outline: none !important;
        box-shadow: none;
    }

    .text-black {
        color: black
    }

    .mt-30 {
        margin-top: 30px;
    }

    .background-color-white {
        background-color: white;
    }

    .background-color-black {
        background-color: black !important;
    }

    .w-284 {
        width: 284px;
    }

    .mt-12 {
        margin-top: 12px;
    }

    .btn-1 {
        background-color: #F38704;
    }

    .btn-circle.btn-md { 
        width: 50px; 
        height: 50px; 
        padding: 7px 10px; 
        border-radius: 25px; 
        font-size: 10px; 
        text-align: center; 
    }

    .mt-44 {
        margin-top: 44px;
    }

    .ml-7 {
        margin-left: 7px;
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
        #plus-icon {
            font-size: 1.5rem;
        }

        #add-button-icon {
            font-size: 24px;
        }
    }
</style>

<script>
    import { mapGetters } from 'vuex';
    
    export default {
        created() {
            this.$store.dispatch('fetchTeamsCreated', {
                user_id: this.user.id
            }),
            this.$store.dispatch('fetchTeamsJoined', {
                user_id: this.user.id
            })
        },
        computed: mapGetters({
            user: 'auth/user',
            teamsCreated: 'teamsCreated',
            teamsJoined: 'teamsJoined'

        })
    };
</script>