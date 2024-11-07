<template>
  <div id="app">
    <h1>Tweet Something!!!</h1>
    <form @submit.prevent="postTweet">
      <input type="text" v-model="tweet" placeholder="What's on your mind?" />
      <button type="submit">Tweet</button>
    </form>
  </div>
</template>

<script>
import { useToast } from "vue-toastification";

export default {
  data() {
    return {
      tweet: "", // Model to hold the tweet text
    };
  },
  setup() {
    const toast = useToast();
    return { toast };
  },
  methods: {
    async postTweet() {
      if (!this.tweet) {
        this.toast.error("Tweet cannot be empty");
        return;
      }

      try {
        const response = await fetch("http://localhost:5000/tweets", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.tweet),
        });

        if (response.ok) {
          this.toast.success("Tweet posted successfully!");
          this.tweet = ""; // Clear the input field
        } else {
          const error = await response.json();
          this.toast.error("Failed to post tweet: " + error.message);
        }
      } catch (err) {
        this.toast.error("An error occurred: " + err.message);
      }
    },
  },
};
</script>

<style>
/* Add any styles as you like */
</style>
