<template>
<div class="card">
    <img class="icon" v-bind:src="require(`@/assets/${icon}`)"/>
    <div class="title"><span>{{name}}</span></div>
    <div class="wbtn">
        <button v-if="enable" @click="claim" class="btn">
            <div class="btn-txt">{{'Claim'}}</div>
        </button>
        <button v-else @click="claim" disabled class="btn">
            <div class="btn-txt">{{'Claim'}}</div>
        </button>
    </div>
</div>
</template>

<script>
import airdrop from '../service/var'
export default {
    name: 'Card',
    data() {
        return {
            enable: true
        }
    },
    props: ['name', 'icon', 'address'],
    methods: {
        claim: function () {
            airdrop.claim(this.address).then(console.log)
        }
    },
    mounted() {
        // setInterval(() => {
        //     airdrop.enable(this.address).then(
        //     (res) => {
        //         this.enable = res
        //     }
        // )
        // }, 3000)
    }
}
</script>

<style scoped>
.card {
    margin: 20px;
    display: flex;
    flex-direction: column;
    background: #384067;
    align-items: center;
    border-radius: 20px;
    width: 350px;
    height: 500px;
    color: #FFF;
    position: relative;
}


.title {
    display: flex;
    flex-direction: start;
    padding: 20px;
    font-size: 24px;
}

.icon {
    width: 100px;
    height: 100px;
    padding: 20px;
    align-items: center;
}

.wbtn {
    position: absolute;
    bottom: 20px;
    width: 90%;
    margin-top: 1rem;
}

.btn {
    width: 100%;
    height: 60px;
    font-weight: 500;
    text-align: center;
    border-radius: 10px;
    outline: none;
    border: 1px solid transparent;
    text-decoration: none;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    flex-wrap: nowrap;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    position: relative;
    z-index: 1;
    color: white;
    box-sizing: border-box;
    margin: 0px;
    min-width: 0px;
    appearance: none;
    transition: all 0.1s ease-in-out;

    background: linear-gradient(143deg, #FAAB9B 0%, #F5869F 100%);
    box-shadow: 0px 4px 10px 0px #181f39;
}

.btn:disabled {
    opacity: 0.5;
    cursor: auto;
    box-shadow: none;
    border: 1px solid transparent;
    outline: none;
}

.btn-txt {
    box-sizing: border-box;
    margin: 0px;
    min-width: 0px;
    font-size: 20px;
    font-weight: 500;
}

.info {
    width: 80%;
    color: #FFF;
    font-size: 14px;
    margin-bottom: 5px;
}
</style>
