pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  //declare smart contract
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet8() public {
      //apply function adopt() to adoption smart contract
      uint returnedId = adoption.adopt(8);
      uint expected = 8;

      Assert.equal(returnedId, expected, "Pet ID 8 should be recorded.");
    } // end of function testUserCanAdoptPet8()

    ////////////////////////////////////////////////////////////////////////////////
    // Testing retrieval of a single pet's owner (pet ID 8)
    function testGetAdopterAddressByPetId8() public {

      // Expected owner of pet ID 8
      address expected = this;

      address adopter = adoption.adopters(8);

      Assert.equal(adopter, expected, "Owner (or non-ownership) of pet ID 8 should be recorded.");
    } // end of function testGetAdopterAddressByPetId8()

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray8() public {
      // Expected owner will be owner with pet ID 8
      address expected = this;

      // Store adopters in memory rather than contract's storage
      address[16] memory adopters = adoption.getAdopters();

      Assert.equal(adopters[8], expected, "Owner (or non-ownership) of pet ID 8 should be recorded.");
    } // end of function testGetAdopterAddressByPetIdInArray8()

    function testUserCanAdoptPet15() public {
      uint returnedId = adoption.adopt(15);
      uint expected = 15;

      Assert.equal(returnedId, expected, "Pet ID 15 should be recorded.");
    } // end of function testUserCanAdoptPet15()

    // Testing retrieval of a single pet's owner (pet ID 15)
    function testGetAdopterAddressByPetId15() public {
      // Expected owner of pet ID 15
      address expected = this;
      address adopter = adoption.adopters(15);

      Assert.equal(adopter, expected, "Owner (or non-ownership) of pet ID 15 should be recorded.");
    } // end of function testGetAdopterAddressByPetId15()

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray15() public {
      // Expected owner will be owner with pet ID 15
      address expected = this;

      // Store adopters in memory rather than contract's storage
      address[16] memory adopters = adoption.getAdopters();

      Assert.equal(adopters[15], expected, "Owner (or non-ownerhship) of pet ID 15 should be recorded.");
    } // end of function testGetAdopterAddressByPetIdInArray15()
} // end of contract TestAdoption {}
