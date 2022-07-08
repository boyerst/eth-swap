const Token = artifacts.require('Token')
const EthSwap = artifacts.require('EthSwap')


require('chai')
  .use(require('chai-as-promised'))
  .should()


contract('EthSwap', (accounts) => {
  
  describe('Token deployment', async () => {
    it('contract has a name', async () => {
      let token = await Token.new()
      // console.log("ETHHHHHHSWAP", ethSwap)
      const name = await token.name()
      assert.equal(name, 'DappToken')
    })  
  })

  describe('EthSwap deployment', async () => {
    it('contract has a name', async () => {
      let ethSwap = await EthSwap.new()
      // console.log("ETHHHHHHSWAP", ethSwap)
      const name = await ethSwap.name()
      assert.equal(name, 'EthSwap')
    })  
  })


})