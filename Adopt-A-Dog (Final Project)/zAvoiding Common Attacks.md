##Test
- 6 tests were written in solidity to make sure Adoption.sol is correctly mapping the Adopters to their adopted dogs properly:
    1. testUserCanAdoptPet8: tests the adopt() function to make sure proper pet ID 8 has been stored. Pet ID 8 should be recorded.
    2. testGetAdopterAddressByPetId8: tests the adopters() function using pet ID 8. Owner (or non-ownership) of pet ID 8 should be recorded.
    3. testGetAdopterAddressByPetIdInArray8: tests the getAdopters() function and grabs the owner of pet ID 8 from the full array. Owner (or non-ownership) of pet ID 8 should be recorded.
    4. testUserCanAdoptPet15: tests the adopt() function to make sure proper pet ID 15 has been stored. Pet ID 15 should be recorded.
    5. testGetAdopterAddressByPetId15: tests the adopters() function using pet ID 8. Owner (or non-ownership) of pet ID 8 should be recorded.
    6. testGetAdopterAddressByPetIdInArray15: tests the getAdopters() function and grabs the owner of pet ID 8 from the full array. Owner (or non-ownership) of pet ID 8 should be recorded.
- To avoid re-entrancy attacks, calls to external contracts and functions were limited. For example, `selfdestruct(owner)` will simply return any ETH held by the contract back to `owner`. If `.balanceof()` and/or `.transfer()` functions were used this would open the contract to re-entrancy attacks. When you inherit from contract `Mortal{}` and add external functions, they can be indirectly called from the `close()` function.  
- All tests are run using `truffle test` in the command line.
