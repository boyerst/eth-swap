const Token = artifacts.require('Token')
const EthSwap = artifacts.require('EthSwap')


require('chai')
  .use(require('chai-as-promised'))
  .should()

// We are NOT actually converting Ether, but rather our own token
  // However we can use the same web3JS helper because our token has 18 decimal places
function tokens(n) {
  return web3.utils.toWei(n, 'ether');
}

contract('EthSwap', (accounts) => {

  let token, ethSwap

  before(async () => {
    token = await Token.new()    
    ethSwap = await EthSwap.new()
    // We use the tokens() helper function above to covert this number to a more human readable format
      // From human readable format to machine (EVM) readable format
          // unsigned integer      ===> wei
          // (1 million) 1,000,000 ===> 1000000000000000000000000
    await token.transfer(ethSwap.address, tokens('1000000'))
  })
  
  describe('Token deployment', async () => {
    it('contract has a name', async () => {
      const name = await token.name()
      assert.equal(name, 'DappToken')
    })  
  })

  describe('EthSwap deployment', async () => {
    it('contract has a name', async () => {
      const name = await ethSwap.name()
      assert.equal(name, 'EthSwap')
    })  
    it('contract has tokens', async () => {
      let balance = await token.balanceOf(ethSwap.address)
      assert.equal(balance.toString(),  tokens('1000000'))
    })
  })


})


