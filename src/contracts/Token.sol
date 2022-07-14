pragma solidity >=0.4.21 <0.6.0;


contract Token {
  string public name = "DappToken";
  // uint256 public totalSupply = 1000000000;
  uint256 public totalSupply = 1000000000000000000000000;
  string public symbol = "DAPP";

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

  mapping(address => uint256) public balanceOf;
  // Nested mapping to map spending allowance 
    // ❓❓❓mapping(at msg.sender address => mapping(at spender address store a value of allowance)) that stores the amount allowed to spend
  mapping(address => mapping(address => uint256)) public allowance;

// Run whenever contract deployed
  constructor() public {
    // Total supply is assigned to the deployer
    // In this case it will be assigned to the first account in ganache
    // BUT we don't want the user to have them - we want the EthSwap contract to have them
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

  function approve(address _spender, uint256 _value) public returns (bool success) {
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(_value <= balanceOf[_from]);
    require(_value <= allowance[_from][msg.sender]);
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    allowance[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
  }

}





