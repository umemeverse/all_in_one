import Web3 from 'web3'

export default class {
  static getWeb3 () {
    if (!this.isConnected) {
      return null
    }
    return window.web3
  }

  static isConnected () {
    return window.ethereum.isConnected() && window.ethereum.selectedAddress
  }

  static enable () {
    return window.ethereum.enable()
  }

  static chainId () {
    return window.ethereum.networkVersion
  }

  static defaultAddress () {
    return window.ethereum.selectedAddress
  }

  static newContract (ABI, contractAddress) {
    const web3 = new Web3(window.web3.currentProvider)
    return new web3.eth.Contract(ABI, contractAddress)
  }
}
