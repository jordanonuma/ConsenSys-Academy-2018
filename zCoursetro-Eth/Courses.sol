pragma solidity ^0.4.18;


contract Courses {

  struct Instructor {
    uint age;
    string fName;
    string lName;
  }

  /* Here, we're creating a mapping, which accepts first the key type
  (in our case, it will be an address type), and the value type will be our
  Struct that we created above, then we're referring to this mapping as `instructorsMap`.

  This will allow us to look up a specific instructor with their Ethereum address
  and retrieve their age, first name and last name.
  */
  mapping (address => Instructor) instructorsMap;

  // Defines an address array that will store all of the instructor addresses.

  /* This address array `instructorArrayForAll` is useful because you currently cannot
  return a mapping like `instructorsMap` and simply iterate through all of the
  available instructors.
  */
  address[] public instructorArrayForAll;

  /* Instead, you would have to:
     1) return a list of instructor accounts with address array
        `instructorArrayForAll` [function getInstructors()]
     2) and then make a specific function call to grab the single instructor's
        information based on the Ethereum address [function getInstructor()]
  */
  function setInstructor (address _address, uint _age, string _fName, string _lName) public {
    var instructor = instructorsMap[_address]; //`instructorsMap` is the mapping from address => `Instructor` Struct
                                               // I believe `instructorsMap` doesn't need to pass through as an argument to `setInstructor` since it's public.

    instructor.age = _age;
    instructor.fName = _fName;
    instructor.lName = _lName;

    /* When the contract owner sets the instructor (e.g. first name: son-Goku, age:16),
       the below pushes the newly-set instructor's address to the array of all
       instructors' addresses `instructorArrayForAll` previously declared above.
    */

    /* the array.push() member function returns the length of the new array.
       Since arrays are zero indexed, subtracting one gives the index of the
       last element `_address`.

       https://ethereum.stackexchange.com/questions/40312/what-is-the-return-of-array-push-in-solidity
    */
    instructorArrayForAll.push(_address) - 1;
  } // end of function setInstructor

  /* This function returns a list of all addresses from where they're necessarily
     stored in address array `instructorArrayForAll`.
  */
  function getInstructors () view public returns (address[]) {
    return instructorArrayForAll;
  } //end of function getInstructors

  /* Above, function `getInstructors` provides access to all instructors' Ethereum
     accounts.
     Below, function `getInstructor` provides access to retrieve a specific
     instructor given a user-provided address.
  */
  function getInstructor (address _address) view public returns (uint, string, string) {
    return (instructorsMap[_address].age, instructorsMap[_address].fName, instructorsMap[_address].lName);
  } //end of function getInstructor

   /* This function sums the total instructors that have been set.
   */
  function countInstructors() view public returns (uint) {
    return instructorAccts.length;
  } //end of function countInstructors()

} //end of contract Courses.sol
