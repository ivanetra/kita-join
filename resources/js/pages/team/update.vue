<template>
    <div>
        <div id="not-available" class="d-none d-sm-block d-sm-none d-md-block">
            <div id="not-available-container" class="bg-white text-center pt-3 pb-3">
                <fa id="laptop" icon="laptop"></fa>
                <h1 id="oops" class="font-weight-normal">Oops!</h1>
                <p class="mt-4 font-weight-normal">Sorry, we're only available in mobile right now. We'll let you know as soon as we are!</p>
            </div>
        </div>
        <card class="d-block d-sm-none d-none d-sm-block d-md-none mt-3 mb-5 background-color-black">
            <form @submit.prevent="update" @keydown="form.onKeydown($event)" method="POST">
                <label class="text-white">Team name <span class="text-danger">*</span></label>
                <input id="contest-name-input" class="form-control background-color-black" type="text" v-model="team.post_name" required>
                <label class="mt-4 text-white">Contest category <span class="text-danger">*</span></label>
                <input id="contest-category-input" class="form-control background-color-black" type="text" v-model="team.category" required>
                <label class="mt-4 text-white">Team description <span class="text-danger">*</span></label>
                <textarea id="team-description-textarea" class="form-control background-color-black" rows="4" v-model="team.description" required></textarea>
                <v-button class="mt-4 background-color-1" :loading="form.busy">
                   Save
                </v-button>
            </form>
        </card>
    </div>
</template>

<style scoped>
    .card {
        padding: 8px;
    }

    .background-color-black {
        background-color: black;
    }

    .background-color-1 {
        background-color: #F38704;
    }

    #contest-name-input, #contest-category-input, #team-description-textarea {
        -webkit-text-fill-color: white;
    }

    input:focus, textarea:focus {
        box-shadow: none !important;
        border-color: white;
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
</style>

<script>1
    import Form from 'vform'
    import { mapGetters } from 'vuex';
    import axios from 'axios'

    export default {

        data: () => ({
            form: new Form({
                post_name: null,
                category: null,
                description: null
            })
        }),

        computed: mapGetters({
            team: 'team',
        }),

        mounted () {
            this.$store.dispatch('fetchTeam', {
                id: this.$route.params.id
            })
        },

        methods: {
            async create() {

                // Create the team
                const { data } = await this.form.post('/api/post/create')

                // Redirect home
                this.$router.push({ name: 'team' })
            },

            update(e) {
                e.preventDefault();
                let currentObj = this;

                let formData = new FormData();
                formData.append('post_name', this.team.post_name);
                formData.append('category', this.team.category);
                formData.append('description', this.team.description);

                axios.post('/api/post/update/' + this.team.id, formData).then(function (response) {
                    currentObj.success = response.data.success;
                }).catch(function (error) {
                    currentObj.output = error;
                });

                this.$router.push({ name: 'team.details', params: {id: this.$route.params.id, user_id: this.team.user_id} })
            },
        }
    }
</script>