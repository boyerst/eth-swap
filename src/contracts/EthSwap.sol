pragma solidity >=0.4.21 <0.6.0;

import "./Token.sol";

contract EthSwap {
  // This is a 'state' var because the data within this var is actually stored on the blockchain
  string public name = "EthSwap";
  // Create a variable that represents a Token contract
    // We will be able to call the token methods on this variable
      // For example when we swap tokens within the app via the EthSwap contract interface, we can call the transfer() function that is located in the Token interface FROM the EthSwap interface
  Token public token;
  uint public rate = 100;

  // We have to tell EthSwap where the token contract is on the blockchain so we pass in the contract to interact with the address
    // We pass it in as a Contract Type "MyContract _name"
  constructor(Token _token) public {
    // In the same way that the contract name is declared as a state var and this stored on the blockchain and easily accessed - we want to do the same with the token contract here
    // However, the _token var is just a function argument that we passed in as a local var - making it unaccessible outside of the function scope and NOT stored on the blockchain
    // In order to have it stored on the blockchain we must store it as a state variable
        // 1. First by creating the var above the constructor
        // 2. Then assigning the function argument to it
        // 3. Then because we added an arg to the constructor we have to update migrations and add the Token contract address to ethSwap deployer
    token = _token;
  }

  function buyTokens() public payable {
    // Transfer tokens from EthSwap contract to the buyer by using transfer() function in Token contract
    // Transfer() takes two _to and _value
      // _to = msg.sender
      // _value
        // The buyer will be buying the tokens with ETH, so we need to calc how many tokens they get based upon the ETH amount that they are sending


    // 1. We create a var called tokenAmount
        // tokenAmount = Amount of Ethereum * Redemption rate
        // Redemption rate = # of tokens they receive for 1 ether (in this case it is 100)
    // 2. We create a state var called rate
    uint tokenAmount = msg.value * rate;
    token.transfer(msg.sender, tokenAmount);
  }





}