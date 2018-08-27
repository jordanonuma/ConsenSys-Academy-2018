## Tests
6 tests were written in TestAdoption.sol to make sure Adoption.sol is correctly mapping the Adopters to their adopted dogs properly:  

  1. **testUserCanAdoptPet8**: tests the `adopt()` function to make sure proper pet ID 8 has been stored. Pet ID 8 should be recorded.
  2. **testGetAdopterAddressByPetId8**: tests the `adopters()` function using pet ID 8. Owner (or non-ownership) of pet ID 8 should be recorded.
  3. **testGetAdopterAddressByPetIdInArray8**: tests the `getAdopters()` function and grabs the owner of pet ID 8 from the full array. Owner (or non-ownership) of pet ID 8 should be recorded.
  4. **testUserCanAdoptPet15**: tests the adopt() function to make sure proper pet ID 15 has been stored. Pet ID 15 should be recorded.
  5. **testGetAdopterAddressByPetId15**: tests the `adopters()` function using pet ID 15. Owner (or non-ownership) of pet ID 15 should be recorded.
  6. **testGetAdopterAddressByPetIdInArray15**: tests the `getAdopters()` function and grabs the owner of pet ID 15 from the full array. Owner (or non-ownership) of pet ID 15 should be recorded.

All tests are run using `truffle test` in the command line.

## Re-entrancy Attacks
To avoid re-entrancy attacks, calls to external contracts and functions were limited. For example, `selfdestruct(owner)` will simply return any ETH held by the contract back to _owner_. If functions such as `.balanceof()` and/or `.transfer()` were used to send other ERC-20 back to _owner_ on `close()` this would open the contract to re-entrancy attacks. When you inherit from contract `Mortal{}` and add external functions, they can be indirectly called from the `close()` function.

## Poisoned Data: Users Inputting Unacceptable Data  
### Inputting pet ID outside of the range (range is set by the finite number of dogs available).

  In Remix, users have the opportunity to input the petID data. Only IDs within the range of 0 to 15 inclusive are permitted for the array size of 16. To mitigate user error, the code `require(petId >= 0 && petId <= 15);` is used. Anything outside of the range will be ignored.  

### Adopting someone else's dog.

  In order to adopt a dog, the dog cannot have been adopted by someone else. This is enforced in the `adopt()` function by `require(adopters[petId].length == 0);`.  

  Furthermore, when the dApp is accessed via [localhost:3000](localhost:3000), once a dog has been adopted, the _Adopt_ button is grayed out and changed to `Success`. This prevents the user from adopting someone else's dog.
