pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(8);

    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
    }

    ////////////////////////////////////////////////////////////////////////////////
    // Testing retrieval of a single pet's owner (ID 8)
    function testGetAdopterAddressByPetId() public {

    // Expected owner will has ID 8
    address expected = this;

    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {

    // Expected owner will be owner with ID 8
    address expected = this;

    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
    }

    function testUserCanAdoptPet2() public {
    uint returnedId = adoption.adopt(9);

    uint expected = 9;

    Assert.equal(returnedId, expected, "Adoption of pet ID 9 should be recorded.");
    }

    ////////////////////////////////////////////////////////////////////////////////
    // Testing retrieval of a single pet's owner (ID 9)
    function testGetAdopterAddressByPetId2() public {

    // Expected owner will has ID 9
    address expected = this;

    address adopter = adoption.adopters(9);

    Assert.equal(adopter, expected, "Owner of pet ID 9 should be recorded.");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray2() public {

    // Expected owner will be owner with ID 9
    address expected = this;

    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[9], expected, "Owner of pet ID 9 should be recorded.");
    }
}
