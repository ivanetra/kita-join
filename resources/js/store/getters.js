let getters = {
    people: state => {
        return state.people
    },
    teams: state => {
        return state.teams
    },
    teamsCreated: state => {
        return state.teamsCreated
    },
    teamsJoined: state => {
        return state.teamsJoined
    },
    team: state => {
        return state.team
    },
    person: state => {
        return state.person
    },
    user: state => {
        return state.user
    },
    form: state => {
        return state.form
    },
    requests: state => {
        return state.requests
    },
    joinStatus: state => {
        return state.joinStatus
    }
}

export default getters