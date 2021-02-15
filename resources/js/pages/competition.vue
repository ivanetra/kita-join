<template>
    <form>
        <div class="form-group">
            <label for="com-name">Competition Name</label>
            <input type="text" class="form-control" name="nameCom" id="nameCom" >
        </div>

        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" class="form-control" name="locationCom" id="locationCom" >
        </div>

        <div class="form-group">
            <h6>Type of Competition</h6>
            <input type="radio" id="olahragaCom" value="Olahraga" v-model="type">
            <label for="olahragaCom">Olahraga</label><br>
            <input type="radio" id="akademikCom" value="Akademik" v-model="type">
            <label for="akademikCom">Akademik</label><br>
            <input type="radio" id="gamingCom" value="Gaming" v-model="type">
            <label for="gamingCom">Gaming</label><br>
            <span>Picked: {{ type }}</span>
        </div>

        <div class="form-group">
            <h6>Category</h6>
            <select v-model="category">
                <option disabled value="">Select Category</option>
                <option>Individu</option>
                <option>Group</option>
            </select><br>
            <span>Selected: {{ category }}</span>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" name="descCom" id="descCom" rows="5"></textarea>
        </div>

        <div class="form-group">
            <h6>Poster Upload</h6>
            <input type="file" class="form-control" v-on:change="onImageChange">
        </div>

        <button type="submit" class="btn btn-primary" @click="uploadImage">Submit Competition</button>
    </form>
</template>


<script>
import { mapGetters } from 'vuex';

export default {
    middleware: 'auth',
    data(){
        return {
        image: '',
        type: '',
        category: ''
        }
    },
    mounted() {
        this.$store.dispatch('fetchPeople')
    },
    computed: {
        ...mapGetters([
        'people'
        ])
    },
    metaInfo () {
        return { title: this.$t('home') }
    },
    methods: {
        onImageChange(e) {
            let files = e.target.files || e.dataTransfer.files;
            if (!files.length)
                return;
            this.createImage(files[0]);
        },
        createImage(file) {
            let reader = new FileReader();
            let vm = this;
            reader.onload = (e) => {
                vm.image = e.target.result;
            };
            reader.readAsDataURL(file);
        },
        uploadImage(){
            axios.post('/image/store',{image: this.image}).then(response => {
                console.log(response);
            });
        }
    }
};
</script>


<style scoped>
    div.form-group, h6 {
        color: white;
    }

</style>