const Token = artifacts.require('Token')
const EthSwap = artifacts.require('EthSwap')


require('chai')
  .use(require('chai-as-promised'))
  .should()

// function tokens(n) {
//   return web3.utils.toWei(n, 'ether');
// }

contract('EthSwap', (accounts) => {

  let token, ethSwap

  // before(async () => {
  //   token = await Token.new()    
  //   ethSwap = await EthSwap.new(token.address)
  //   await token.transfer(ethSwap.address, tokens('1000000000'))
  // })
  
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
    // it('EthSwap contract has balance of tokens', async () => {
    //   let balance = await token.balanceOf(ethSwap.address)
    //   assert.equal(balance.toString(), tokens('1000000000'))
    // })
    it('EthSwap contract has balance of tokens', async () => {
      let token = await Token.new()
      let ethSwap = await EthSwap.new()
      await token.transfer(ethSwap.address, '1000000000')
      let balance = await token.balanceOf(ethSwap.address)
      assert.equal(balance.toString(), '1000000000')
    })
  })


})
