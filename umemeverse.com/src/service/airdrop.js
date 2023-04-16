import AIRDROPABI from './airdropabi'
import Common from './common'

export default class {
  constructor (address) {
    this.address = address
    this.contract = Common.newContract(AIRDROPABI, address)
  }

  // async enable (token) {
  //   const result = await this.contract.methods.canClaim(token, Common.defaultAddress()).call()
  //   return result
  // }

  async enable () {
    return true
  }

  async claim (token) {
    const res = await this.contract.methods.claim(token).send({ from: Common.defaultAddress() })
    return res
  }
}
