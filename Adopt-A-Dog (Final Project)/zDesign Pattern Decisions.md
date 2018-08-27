## Design Pattern Implemented  
Using contract inheritance, the design pattern `Mortal is Owned` was implemented as an emergency stop. With `selfdestruct(owner)` where `owner` is `msg.sender`, the _owner_ can call function `close()` to remove the Adoption.sol smart contract from the blockchain and return any ETH held by the contract to _owner_.  

This option was used because it would give the store owner who deploys Adoption.sol the ability to control any misbehavior (similar to the circuit break design pattern). However, because the dApps's likely undesirable behavior is a mismatch between the adopters and the dogs (whether by a user's change of mind or accidental Adopt button click), simply freezing and unfreezing the contract wouldn't be enough. The contract would need to be reverted back to some previous state.  

## Others Considered But Not Implemented  
The speed bump pattern was also considered because of its useful ability to slow down undesirable behavior. This could have worked well in allowing for a dog trial period, for example, before crystallizing an address as the dog's adopter on the blockchain. However, this was considered additional functionality but not necessary for security.  

Closing the `Adoption.sol` smart contract using auto deprecation was considered, perhaps to simulate which dogs were available at the opening and closing of the shop. However, there would still need to be a further design pattern layered on top that would account for undesirable behavior.  

Restricting function access by specific address also is useful for taking this dApp further. For example, once adopters have been registered on the blockchain, a governance mechanism could allow for adopters to allow for those adopters to provide dog-sitting or walking services in rotation or for a fee to other adopters. However, restricting the simple `adopt` function to specific addresses during the adoption process seemed to only hurt the chances of the dogs getting adopted.  
