pragma solidity ^0.4.20

import "./ownable.sol";
import "./safemath.sol";
import "./erc721.sol";

contract EtherPass is Ownable {
//@dev safemath prevents overflow on uint256's
  using SafeMath for uint256;
///@dev creates a new password token
  event NewPass(uint passId, string name, string hashPass);
  /**
   * @dev the struct for the password token,
   * just the name the pwd goes to and the hashed pwd.
   */
  struct Pass {
    string name;
    string hashPass;
  }

  Pass[] public passes;

  mapping(uint => address) public passToOwner;
  mapping(address => uint) ownerPassCount;

  function _createPass(string _name, string _hashPass) internal {
    uint id = passes.push(Pass(_name, _hashpass)) - 1;
    passToOwner[id] = msg.sender;
    ownerPassCount[msg.sender].add(1);
    NewPass(id, _name, _hashPass);
  }

  function createPass(string _name, string _hashPass) public {
    require(ownerPassCount[msg.sender] == 0);
    _createPass(_name, _hashPass);
  }
}
