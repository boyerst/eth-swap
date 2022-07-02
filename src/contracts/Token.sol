pragma solidity >=0.4.21 <0.6.0;

contract DappToken {
  string public name = "DappToken";
  uint256 public totalSupply = 1000000000;
  string public symbol = "DAPP";

  event Transfer(
  );

  event Approval(
  );

  constructor() public {

  }


}