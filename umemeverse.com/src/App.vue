<template>
  <div id="app">
    <div class="nav">
      <router-view/>
    </div>
  </div>
</template>

<script>
import Common from './service/common'

export default {
  name: 'App',
  mounted() {
    Common.enable()
    let ticker = setTimeout(() => {
      let chainId = Common.chainId()
      if (chainId && chainId != 56) {
        alert("Please login with your BSC wallet!", Common.chainId())
      } else {
        clearInterval(ticker)
      }
    }, 500)
    
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 30px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.nav {
  height: 25px;
  width: 100%;
}

body {
  padding: 0;
  margin: 0;
  height: 100%;
  min-height: 100vh;
  min-width: 360px;
  background-color: #2A3253;
}
</style>
