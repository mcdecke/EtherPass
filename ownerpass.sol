pragma solidity ^0.4.20

import "./ownable.sol";
import "./safemath.sol";
import "./erc721.sol";

//transfers ownership of encrypted passwords
contract OwnerPass is ERC721 {

  using SafeMath for uint256;

  mapping (uint => address) passApprovals;


}
