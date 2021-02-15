function page (path) {
  return () => import(/* webpackChunkName: '' */ `~/pages/${path}`).then(m => m.default || m)
}

export default [
  { path: '/', name: 'welcome', component: page('welcome.vue') },

  { path: '/login', name: 'login', component: page('auth/login.vue') },
  { path: '/register', name: 'register', component: page('auth/register.vue') },
  { path: '/email-confirmation/:id', name: 'email.confirmation', component: page('emailconfirmation.vue'), props: true},
  { path: '/competition', name: 'competition', component: page('competition.vue') },
  { path: '/password/reset', name: 'password.request', component: page('auth/password/email.vue') },
  { path: '/password/reset/:token', name: 'password.reset', component: page('auth/password/reset.vue') },
  { path: '/email/verify/:id', name: 'verification.verify', component: page('auth/verification/verify.vue') },
  { path: '/email/resend', name: 'verification.resend', component: page('auth/verification/resend.vue') },

  { path: '/home', name: 'home', component: page('home.vue') },
  { path: '/settings',
    component: page('settings/index.vue'),
    children: [
      { path: '', redirect: { name: 'settings.profile' } },
      { path: 'profile/:id', name: 'settings.profile', component: page('settings/profile.vue'), props: true},
      { path: 'password', name: 'settings.password', component: page('settings/password.vue') }
    ] },

  { path: '*', component: page('errors/404.vue') },

  { path: '/auth/:provider/callback',
      component: {
        template: '<div class="auth-component"></div>'
      } 
  },
  { path: '/team', name: 'team', component: page('team/index.vue')},
  { path: '/team/create', name: 'create.team', component: page('team/create.vue') },
  { path: '/team-details/:id/:user_id', name: 'team.details', component: page('team/details'), props: true},
  { path: '/team/update/:id', name: 'update.team', component: page('team/update'), props: true},
  { path: '/profile-details/:id', name: 'profile.details', component: page('profiledetails.vue'), props: true}
]
