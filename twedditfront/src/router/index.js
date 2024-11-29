import { createRouter, createWebHistory } from 'vue-router';
import TweetPage from '@/views/TweetPage.vue'; 
import LoginPage from '@/views/LoginPage.vue'; 
import RegisterPage from '@/views/RegisterPage.vue'; 

const routes = [
  {
    path: '/tweet', // URL path for the page
    name: 'TweetPage',
    component: TweetPage,
  },
  {
    path: '/login', // URL path for the page
    name: 'login',
    component: LoginPage,
  },
  {
    path: '/register', // URL path for the page
    name: 'register',
    component: RegisterPage,
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
