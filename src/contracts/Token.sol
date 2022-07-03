pragma solidity >=0.4.21 <0.6.0;

contract DappToken {
  string public name = "DappToken";
  uint256 public totalSupply = 1000000000;
  string public symbol = "DAPP";

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  event Approval(
  );

  constructor() public {

  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function approve() {

  }


}