<template>
<div class="body">
  <div class="container">
    <Card name="FUCK ELON MUSK" icon="fuck.png" address="0xD51FD6Ab041E4bf5d843F683911EBd775cd575CD"></Card>
    <Card name="HCdoge" icon="hcdoge.png" address="0x4c3ccaabd34c58000a738a5c6d735d959b3265a1"></Card>
    <Card name="HeYi" icon="heyi.png" address="0x269B345C54dd76098320afa633C132ab8027a19B"></Card>
    <Card name="JiuMei" icon="jiumei.png" address="0xC807f16a7FD609DCEebB1359f0451069F2BFD128"></Card>
    <Card name="MEME" icon="meme.png" address="0xa25441bD87bAA2D8c974717C2e1d49e62b162a5b"></Card>
    <Card name="DEGOMOON" icon="degomoon.png" address="0x2e388e7e79657e8d117d8375911fa96764431f7e"></Card>
    <Card name="LOWB" icon="loser.png" address="0x843d4a358471547f51534e3e51fae91cb4dc3f28"></Card>
    <Card name="MUSK" icon="musk.png" address="0xa45d3247164a0f4fc02264fc3ec9bc9512967043"></Card>
    <Card name="JBM" icon="jbm.png" address="0x1e4ead1cc0604c1bb1bbe6aaeee2be563c4c95ae"></Card>
    <Card name="KOBE" icon="kobe.png" address="0x5ee164d79f4C5B6144B1341381cEeC2fdA79fa68"></Card>
    <Card name="CAT" icon="cat.png" address="0xE22FFb5236954482E5D56e20cE7C52F0Cf936374"></Card>
    <Card name="NASA" icon="nasa.png" address="0xC2E41C9813EA86916A51A5699fd217cC270fb044"></Card>
    <Card name="SHITDOGE" icon="shitdogs.png" address="0xe91f721D7e60b84e632131d404fA4b50AB30A902"></Card>
  </div>
  <div class="intro">
    <p>Umemeverse aims to do more meme token airdrops, you can claim any coin you want in this site. </p>
    <p>And if you are a project founder and want to do airdrop to your community without spending your own gas,</p>
  you can contact us via <el-link type="primary" class="email">umemeverse.com@gmail.com</el-link> , submit your token information, send us your token and rules.
  </div>
</div>
</template>

<script>
import Card from './Card'
export default {
    name: 'Stake',
    data() {
        return {
            balance: 0,
            amount: 0
        }
    },
    components: {
      Card
    },
    methods: {
        changeMethod: function (value) {
            this.method = value
        }
    },
    computed: {
        unit: function () {
            return this.method === 1 ? 'Num' : 'M'
        }
    }
}
</script>

<style scoped>
.body {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.container {
  width: 95%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  -webkit-box-align: center;
  align-items: center;
  align-content: center;
  flex: 1 1 0%;
  overflow: hidden auto;
  z-index: 1;
  padding: 20px 16px 16px;
}

.intro {
  color: #ffffff;
  font-size: 24px;
}

.email {
  font-size: 26px;
  line-height: 20px;
  font-weight: 500;
}
</style>
