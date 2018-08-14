import { Connect, SimpleSigner } from 'uport-connect'

export let uport = new Connect('React Uport Truffle Boilerplate',{
  clientId: '2ojRm8K6yhos1318emGGAnaYH4UCqz4qYWg',
  network: 'rinkeby',
  signer: SimpleSigner('SIGNING KEY')
})
export const web3 = uport.getWeb3()
