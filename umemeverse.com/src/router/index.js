import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/Home'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      redirect: '/home'
    },
    {
      path: '/home',
      name: 'Home',
      component: Home
    }
  ],
  scrollBehavior () {
    return { x: 0, y: 0 }
  }
})
