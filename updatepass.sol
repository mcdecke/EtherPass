pragma solidity ^0.4.20;

import "./etherpass.sol";

contract UpdatePass is EtherPass {
  //take the password from webpage post
  uint updateFee = 0.001 ether;

  function withdraw() external onlyOwner {
  owner.transfer(this.balance);
}

  //only the owner of the contract can change the fee later
  function setUpdateFee(uint _fee) external onlyOwner {
    updateFee = _fee;
  }

  /* modifier onlyOwnerOf(uint _hashPass) */
  function update(uint _passId, string _newHashPass) external onlyOwnerOf payable {
    require(msg.value == updateFee);
    passes[_passId] == _newHashPass;
  }

  function changeName(uint _passId, string _newName) external onlyOwnerOf {
    passes[_passId] == _newName;
  }
}
