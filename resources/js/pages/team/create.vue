<template>
    <div>
        <div class="d-none d-sm-block d-sm-none d-md-block padding-50">
            <div class="row">
                <div class="col">
                    <img class="mt-5" src="/svg/create_team.svg" id="graphic-image"/>
                    <h4 class="text-center mt-5">Post your team on the #1 site for finding quality teams</h4>
                </div>
                <div class="col mr-50">
                    <card class="disable-border">
                        <form @submit.prevent="create" @keydown="form.onKeydown($event)">
                            <label id="team-name-label" class="text-black mb-0">Team name <span class="text-danger">*</span></label>
                            <input id="team-name-input-desktop" class="form-control mt-2 border-color-grey" type="text" v-model="form.post_name" required>
                            <label id="contest-category-label" class="mt-10 mb-0 text-black">Contest category <span class="text-danger">*</span></label>
                            <input id="contest-category-input-desktop" class="form-control mt-2 border-color-grey" type="text" v-model="form.category" required>
                            <label id="team-description-label" class="mt-10 mb-0 text-black">Team description <span class="text-danger">*</span></label>
                            <textarea id="team-description-textarea-desktop" class="form-control mt-2 border-color-grey" rows="4" v-model="form.description" required></textarea>
                            <v-button class="mt-4 py-15 background-color-1" :loading="form.busy">
                                Save
                            </v-button>
                        </form>
                    </card>
                </div>
            </div>
        </div>
        <div class="d-block d-sm-none d-none d-sm-block d-md-none">
            <h2 class="text-center mt-5">Post your team on the #1 site for finding quality teams</h2>
            <card class="my-40 background-color-black">
                <form @submit.prevent="create" @keydown="form.onKeydown($event)">
                    <label id="team-name-label" class="text-white mb-0">Team name <span class="text-danger">*</span></label>
                    <input id="team-name-input" class="form-control mt-2 background-color-black" type="text" v-model="form.post_name" required>
                    <label id="contest-category-label" class="mt-28 mb-0 text-white">Contest category <span class="text-danger">*</span></label>
                    <input id="contest-category-input" class="form-control mt-2 background-color-black" type="text" v-model="form.category" required>
                    <label id="team-description-label" class="mt-28 mb-0 text-white">Team description <span class="text-danger">*</span></label>
                    <textarea id="team-description-textarea" class="form-control mt-2 background-color-black" rows="4" v-model="form.description" required></textarea>
                    <v-button class="mt-4 py-15 background-color-1" :loading="form.busy">
                        Save
                    </v-button>
                </form>
            </card>
        </div>
    </div>
</template>

<style scoped>
    .card {
        padding: 8px;
    }

    .mt-28 {
        margin-top: 28px;
    }

    .mt-10 {
        margin-top: 10px;
    }

    .my-40 {
        margin-top: 40px;
        margin-bottom: 40px;
    }

    .padding-50 {
        padding: 50px;
    }

    .mr-50 {
        margin-left: 50px;
    }

    .background-color-black {
        background-color: black;
    }

    .background-color-1 {
        background-color: #F38704;
    }

    .disable-border {
        border: none;
        padding: 0;
    }

    .border-color-grey {
        box-shadow: none !important;
        border-color: grey;
    }

    #team-name-input, #contest-category-input, #team-description-textarea {
        -webkit-text-fill-color: white; 
    }

    #team-name-input-desktop, #contest-category-input-desktop, #team-description-textarea-desktop {
        -webkit-text-fill-color: black; 
    }

    #not-available {
        padding: 50px;
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

    #graphic-image {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 340px;
        height: 240px;
    }

    @media (max-width: 1000px) {
        #team-name-label, #contest-category-label, #team-description-label {
            font-size: 0.825rem;
        }
        input:focus, textarea:focus{
        box-shadow: none !important;
        border-color: white;
    }
    }
</style>

<script>1
    import Form from 'vform'

    export default {
        data: () => ({
            form: new Form({
                post_name: '',
                category: '',
                description: ''
            })
        }),

        methods: {
            async create() {

                // Create the team
                const { data } = await this.form.post('/api/post/create')

                // Redirect home
                this.$router.push({ name: 'team' })
            }
        }
    }
</script>