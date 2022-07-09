const Token = artifacts.require("Token");
const EthSwap = artifacts.require("EthSwap");


module.exports = async function(deployer) {
  await deployer.deploy(Token);
  // To move the tokens to the contract...
  // Fetch the Token contract
  const token = await Token.deployed()

  await deployer.deploy(EthSwap);
  // Fetch EthSwap contract
  const ethSwap = await EthSwap.deployed()

  // Transfer all tokens to EthSwap contract using the transfer function in Token contract
  // await token.transfer(ethSwap.address, '1000000000000000000000000')
};







