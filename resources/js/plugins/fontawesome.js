import Vue from 'vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// import { } from '@fortawesome/free-regular-svg-icons'

import {
  faUser, faLock, faSignOutAlt, faCog, faUsers, faAddressBook, faEdit, faPlus, faLaptop
} from '@fortawesome/free-solid-svg-icons'

import {
  faGithub, faWhatsapp
} from '@fortawesome/free-brands-svg-icons'

library.add(
  faUser, faLock, faSignOutAlt, faCog, faGithub, faUsers, faAddressBook, faEdit, faWhatsapp, faPlus, faLaptop
)

Vue.component('fa', FontAwesomeIcon)
