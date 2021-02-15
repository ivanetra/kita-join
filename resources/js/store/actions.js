import axios from 'axios'

let actions = {
    fetchPeople({commit}) {
        axios.get('/api/profiles')
            .then(res => {
                commit('FETCH_PEOPLE', res.data)
            }).catch(err => {
                console.log(err)
            })
    },
    fetchTeams({commit}) {
        axios.get('/api/posts')
            .then(res => {
                commit('FETCH_TEAMS', res.data)
            }).catch(err => {
            console.log(err)
        })
    },
    fetchTeams({commit}) {
        axios.get('/api/posts')
            .then(res => {
                commit('FETCH_TEAMS', res.data)
            }).catch(err => {
            console.log(err)
        })
    },
    fetchTeamsCreated({commit}, data) {
        axios.get('/api/posts/show/' + data.user_id)
            .then(res => {
                commit('FETCH_TEAMS_CREATED', res.data)
            }).catch(err => {
            console.log(err)
        })
    },
    fetchTeamsJoined({commit}, data) {
        axios.post('/api/posts/joined', data)
            .then(res => {
                commit('FETCH_TEAMS_JOINED', res.data)
            }).catch(err => {
            console.log(err)
        })
    },
    fetchTeam({commit}, data) {
        axios.get('/api/posts/' + data.id)
            .then(res => {
                commit('FETCH_TEAM', res.data)
            }).catch(err => {
            console.log(err)
        })
    },
    fetchPerson({commit}, data) {
        axios.get('/api/profiles/' + data.id)
            .then((res) => {
                commit('FETCH_PERSON', res.data)
            }).catch(err => {
                console.log(err)
            })
    },
    fetchUser({commit}) {
        axios.get('/api/user')
            .then((res) => {
                commit('FETCH_USER', res.data)
            }).catch(err => {
                console.log(err)
            })
    },
    updatePerson(form) {
        axios.post('/api/update/' + form.id, {image: this.form.image, name: this.form.image, about: this.form.about, telephone: this.form.telephone, interest: this.form.interest})
            .then((res) => {
                this.$store.dispatch('fetchPeople')
            }).catch(err => {
                console.log(err);
            })
    },
    fetchRequests({commit}, data) {
        axios.get('/api/followers/' + data.post_id)
            .then((res) => {
                commit('FETCH_REQUESTS', res.data)
            }).catch(err => {
                console.log(err)
            })
    },
    fetchJoinStatus({commit}, data) {
        axios.post('/api/joinstatus', data)
            .then((res) => {
                commit('FETCH_JOIN_STATUS', res.data)
            }).catch(err => {
                console.log(err)
            })
    },
    
}

export default actions