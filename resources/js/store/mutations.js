let mutations = {
    FETCH_PEOPLE(state, people) {
        return state.people = people
    },
    FETCH_TEAMS(state, teams) {
        return state.teams = teams
    },
    FETCH_TEAMS_CREATED(state, teamsCreated) {
        return state.teamsCreated = teamsCreated
    },
    FETCH_TEAMS_JOINED(state, teamsJoined) {
        return state.teamsJoined = teamsJoined
    },
    FETCH_TEAM(state, team) {
        return state.team = team
    },
    FETCH_PERSON(state, person) {
        return state.person = person
    },
    FETCH_USER(state, user) {
        return state.user = user
    },
    FETCH_REQUESTS(state, requests) {
        return state.requests = requests
    },
    FETCH_JOIN_STATUS(state, joinStatus) {
        return state.joinStatus = joinStatus
    }
}

export default mutations