pragma solidity ^0.4.17;

contract Owned {
    constructor () public { owner = msg.sender; } //function owned() has been deprecated for constructor() public {}
    address owner;

    // This contract only defines a modifier but does not use
    // it: onlyOwner will be used in derived contracts.
    // The function's body is inserted where the special symbol
    // `_;` in the definition of a modifier appears.
    // This means that if the owner calls this function, the
    // function is executed and otherwise, an exception is
    // thrown.
    modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    } // end of modifier `onlyOwner{}`
} // end of contract `owned{}`

contract Mortal is Owned {
    // This contract inherits the `onlyOwner` modifier from contract
    // `owned` and applies it to the `close` function, so
    // that calls to `close` only have an effect if
    // they are made by the stored owner.
    function close() public onlyOwner {
        //Transfer (if any) ETH to owner and terminates contract.
        selfdestruct(owner);
    } // end of function `close()`
} // end of contract `mortal{}`

contract Adoption {

    // Initializes a public array `adopters` for 16 dogs
    address[16] public adopters;

    // Function is used to enter user's address as the dog's adopter
    function adopt(uint petId) public returns (uint) {
      // In Remix, user will have to manually enter petId (e.g. "0", "1", ... "15")
      // Via localhost:3000, initial user will have 16 different dog to choose from
      // and will click on the `Adopt` button.
      require(petId >= 0 && petId <= 15);

      // User who clicks on 'Adopt' will be identified as the dog's
      // adopter in the `adopters` array
      adopters[petId] = msg.sender;
      return petId;
    } // end of function `adopt()`

    // Retrieves the whole `adopters` array of size 16
    function getAdopters() public view returns (address[16]) {
      return adopters;
    } // end of function `getAdopters()`

} // end of contract `Adoption{}`
