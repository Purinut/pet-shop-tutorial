pragma solidity ^0.5.0;

contract Adoption {
  address[16] public adopters;
  uint public totalBalance;

  // Owner
  address public owner;
  constructor () public {
    owner = address(this);
  }

  function getOwner() public view returns (address) {
    return owner;
  }

  // Adopting a pet
  function adopt(uint petId) public payable returns (uint) {
    require(petId >= 0 && petId <= 15);
    require(msg.sender.balance >= msg.value);

    totalBalance += msg.value;

    adopters[petId] = msg.sender;

    return petId;
  }

  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }
}