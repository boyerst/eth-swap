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

  mapping(address => uint256) public balanceOf;

  constructor() public {
    balanceOf[msg.sender] = totalSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    // Ensure the sender has balance to send
    require(balanceOf[msg.sender] >= _value);
    // Subtract transfer value from sending address
    balanceOf[msg.sender] -= _value;
    // Add transfer value to receiving address
    balanceOf[_to] += _value;
    // emit that transfer event has happened
    emit Transfer(msg.sender, _to, _value);
    // Return true to indicate successful tx
    return true;
  }

  function approve() {

  }


}