## Design Pattern Implemented  
Using contract inheritance, the design pattern `Mortal is Owned` was implemented as an emergency stop. With `selfdestruct(owner)` where `owner` is `msg.sender`, the `owner` can call function `close()` to remove the Adoption smart contract from the blockchain and return any ETH held by the contract to `owner`.  

This option was used because it would give the store owner who deploys the smart Adoption.sol smart contract the ability to control any misbehavior (similar to the circuit break design pattern). However, because the likely undesirable behavior is a mismatch between the adopters and the dogs (whether by a change of mind or accidental press), simply freezing and unfreezing the contract wouldn't be enough.

## Others Considered but Not Implemented  
The speed bump pattern was also considered because of its ability to slow down undesirable behavior. This could have worked well in allowing for a dog trial period, for example, before crystallizing an address as the dog's adopter on the blockchain.   

Closing the `Adoption.sol` smart contract using auto deprecation was considered, perhaps to simulate which dogs were available at the opening and closing of the shop. However, there would still need to be a further design pattern layered on top that would account for undesirable behavior.  

Restricting function access by specific address also seemed useful for taking this dApp further. For example, once adopters have been registered on the blockchain, a governance mechanism could allow for adopters to allow for adopters to provide dog-sitting or walking services in rotation or for a fee to other adopters. However, restricting the simple `adopt` function to specific addresses seemed to only hurt the chances of the dogs getting adopted.  
