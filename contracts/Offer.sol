pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import "./Job.sol";

contract Offer is Employee {
  function _makeJobOffer() public{
      _jobOffer("chkhor86@gmail.com", "ABC Company", 6500);
  }
}
