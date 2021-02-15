<template>
  <div>
    <div id="home-container" class="row">  
      <div v-if="teams.length" id="home-card-1" class="col">
        <div class="row">
          <div class="col my-auto">
            <h2 id="person-heading">All Teams</h2>
          </div>
          <div class="col">
            <router-link id="create-button" class="btn btn-1 float-right px-3 border-0 text-white font-weight-bold" :to="{name: 'create.team'}" tag="button">
              <fa id="plus-icon" icon="plus" class="my-auto"></fa> <span id="create-team">Create Team</span>
            </router-link>
          </div>
        </div>
        <div id="header" class="row mx-1 mb-3 border-bottom pb-2">
          <div class="col-6 px-4">
            <p class="text-secondary">Name</p>
          </div>
          <div class="col-6 px-4">
            <p class="text-secondary">Category</p>
          </div>
        </div>
        <card v-for="team in teams" v-if="team.user_id !== user.id" v-bind:key="team.id" class="mb-3 mx-1 border-1">
          <router-link id="person-name" :to="{ name: 'team.details', params: {id: team.id, user_id: team.user_id}}" class="d-block navbar-brand text-black">
            <div class="my-auto">
              <div class="row">
                <div class="data col-sm-6 col-xs-12 px-4">
                  <p class="team-name font-weight-bold">{{ team.post_name }}</p>
                </div>
                <div class="team-category-container data col-sm-6 col-xs-12 px-5">
                  <p class="team-category text-1 font-weight-bold">{{ team.category }}</p>
                </div>
              </div>
            </div>
          </router-link>
        </card>
      </div>
      <div v-else id="home-card-2" class="text-center col my-auto">
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

<style scoped>

  @media (max-width: 1000px) {
    #home-card-1 {
      margin-top: 28px !important;
      margin-bottom: 28px !important;
    }
    
    #home-card-2 {
      margin-top: 56px !important;
      margin-bottom: 56px !important;
    }

    #person-heading, #create-button {
      margin-top: 0 !important;
      margin-bottom: 16px !important;
    }

    #person-heading {
      font-size: 1.25rem;
      font-weight: bold;
    }

    .team-name{
      font-size: 1rem !important;
      color: white !important;
    }

    .team-category {
      font-size: 0.825rem !important;
      color: white !important;
      font-weight: normal !important;
    }

    #create-button {
      padding: 0 !important;
      background-color: white;
      color: #F38704 !important;
      font-size: 6vw;
    }

    #create-team {
      display: none;
    }

    #header {
      display: none;
    }

    .card {
      border-radius: 4px !important;
      background-color: black !important;
    }

    .team-category-container {
      padding-left: 24px !important;
      padding-right: 24px !important;
    }
  }

  #home-container {
    height: calc(100vh - 56px);
  } 

  #add-button-icon {
    font-size: 24px;
  }

  .team-name, .team-category, #create-button {
    font-size: 1.25rem;
  }

  .person-row {
    display: flex;
  }

  h6 {
    margin-bottom: 0;
  }

  p {
    margin-bottom: 0;
  }

  .card {
    margin-top: 0;
    border-radius: 8px;
    padding-left: 12px;
    padding-right: 12px;
  }

  #home-card-1 {
    margin-top: 56px !important;
    margin-bottom: 56px !important;
  }

  #person-heading, #person-heading-xs, #create-button{
    margin-top: 3vh;
    margin-bottom: 29px;
  }

  #person-heading-xs {
    text-align: center;
    
  }

  .text-black {
    color: black !important;
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

  .my-56 {
    margin-top: 56px;
    margin-bottom: 56px;
  }

  .mb-23 {
    margin-bottom: 23px;
  }

  .my-4-5 {
    margin-top: 4.5px;
    margin-bottom: 4.5px;
  }

  .background-color-black {
    background-color: black;
  }

  .btn-1 {
    background-color: #F38704;
  }

  .border-1 {
    border-color: #dee2e6;
  }

  .text-1 {
    color: #F38704;
  }

  #create-button {
    border-radius: 0.25rem;
  }

  #create-button:focus, #create-button:active {
    outline: none !important;
    box-shadow: none;
  }
</style>

<script type="text/javascript">
  (sc_adv_out = window.sc_adv_out || []).push({
    id : "745311",
    domain : "n.ads1-adnow.com"
  });
</script>
<script type="text/javascript" src="//st-n.ads1-adnow.com/js/a.js"></script>

<script>
  import { mapGetters } from 'vuex';

  export default {
    middleware: 'auth',
    mounted() {
      this.$store.dispatch('fetchTeams'),
      this.$store.dispatch('fetchUser')
    },
    computed: {
      ...mapGetters([
        'teams',
        'user'
      ])
    },
    metaInfo () {
      return { title: this.$t('home') }
    }
  };
</script>