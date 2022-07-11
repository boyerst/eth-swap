pragma solidity >=0.4.21 <0.6.0;

import "./Token.sol";

contract EthSwap {
  string public name = "EthSwap";
  // Create a variable that represents a Token contract
    // We will be able to call the token methods on this variable
      // For example when we swap tokens within the app via the EthSwap contract interface, we can call the transfer() function that is located in the Token interface FROM the EthSwap interface
  Token public token;

  // We have to tell EthSwap where the token contract is on the blockchain so we pass in the contract to interact with the address
    // We pass it in as a Contract Type "MyContract _name"
  constructor(Token _token) public {
    // Underscore denotes a local variable _token but we declare it as token to help conflict from 'Token public token;' above
    token = _token;
  }


}