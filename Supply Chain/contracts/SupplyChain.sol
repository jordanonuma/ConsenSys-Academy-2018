pragma solidity ^0.4.23;

contract SupplyChain {

  /* set owner */
  address owner;

  /* Variable called "skuCount" tracks the most recent sku (stock keeping unit). */
   uint skuCount;

  /* This public mapping that maps the SKU (a number) to an Item.
     These mappings are called "items".
  */
  mapping(uint => Item) items;

  /* Below is an enum called State. This has 4 states:
        ForSale
        Sold
        Shipped
        Received
    (Declaring them in this order is important for testing).
  */
  enum State {
    ForSale,
    Sold,
    Shipped,
    Received
  }

  /* Struct "Item" with subcategories name, sku, price, state, seller, and buyer.*/
  struct Item {
    string name;
    uint sku;
    uint price;
    uint state;
    address seller;
    address buyer;
  }

  /* Creates 4 events with the same name as each possible State (see above).
    Each event accepts the argument "sku".*/
    event ForSale (uint sku);
    event Sold (uint sku);
    event Shipped (uint sku);
    event Received (uint sku);

  /* Modifier isOwner checks if the msg.sender is the owner of the contract.*/
  modifier isOwner () {
    require (msg.sender == owner);
    /* Example use of '_;' [source: https://www.toshblocks.com/solidity/function-modifiers-solidity-how-they-works/]:

    //this is how we define the modifiers
    modifier onlyCreator() {
        // if a condition is not met then throw an exception
        if (msg.sender != creator) throw;
        // or else just continue executing the function
        _;

        // this is how we add a modifier to the function
        // there can be zero of more number of modifiers
       function kill() onlyCreator {
           selfdestruct(creator);
       }

    }
    */
    _;
  }

  /* Modifier verifyCaller checks if the msg.sender is owner of the address being passed.*/
  modifier verifyCaller (address _address) {
    require (msg.sender == _address);
    _;
  }

  /* Modifier paidEnough checks that contract owner has passed more wei than "_price".*/
  modifier paidEnough (uint _price) {
     require(msg.value >= _price);
     _;
   }

  modifier checkValue (uint _sku) {
    /* Refunds them after paying for item.
      "_" is a special character used in functional modifiers.
      "_" returns the flow of execution to the original function that is annotated.
      https://ethereum.stackexchange.com/questions/19171/what-does-underscore-do#19173 */

    uint _price = items[_sku].price;
    uint amountToRefund = msg.value - _price;
    items[_sku].buyer.transfer(amountToRefund);
    _;
  }

  /* forSale modifier requires that the item with the given sku has the state "ForSale". */
  modifier forSale (uint _sku) {
    require(items[_sku].state == uint(State.ForSale));
    _;
  }

  /* sold modifier requires that the item with the given sku has the state "Sold". */
  modifier sold (uint _sku) {
    require(items[_sku].state == uint(State.Sold));
  }

  /* shipped modifier requires that the item with the given sku has the state "Shipped".*/
  modifier shipped (uint _sku) {
    require(items[_sku].state == uint(State.Shipped));
  }

  /* received modifier requires that the item with the given sku has the state "Received". */
  modifier received (uint _sku) {
    require(items[_sku].state == uint(State.Received));
  }


  constructor() public {
    /* Sets the owner as the person who instantiated the contract. */
    owner = msg.sender;

    /* Sets skuCount to 0. */
    skuCount = 0;
  }

  function addItem(string _name, uint _price) public {
    emit ForSale(skuCount);
    items[skuCount] = Item({name: _name, sku: skuCount, price: _price, state: State.ForSale, seller: msg.sender, buyer: 0});
    skuCount = skuCount + 1;
  }

  /* Function buyItem will:
       Transfer money to the seller.
       Set the buyer as the person who called this transaction.
       Set the state to Sold.

    This function will use 3 modifiers to:
       Check if the item is for sale.
       If the buyer has paid enough.
       Check the value after the function is called to make sure the buyer is refunded any excess ether sent.

    Then the event associated with this function is called.*/

  function buyItem(uint _sku)
    public payable forSale(_sku) paidEnough(items[_sku].price) checkValue(_sku) {

    /* emit EventName(); calls event explicity. The below changes the state of the item to "Sold". */
    emit Sold(_sku);
    items[_sku].buyer = msg.sender;
    items[_sku].state = uint(State.Sold);
    items[_sku].seller.transfer(items[_sku].price);
    }


  function shipItem(uint sku)
    public
    /* Modifer checks if item is sold already. */
    sold(sku)
    /* Modifier checks if the person calling function shipItem is the seller.*/
    verifyCaller(items[sku].seller)

  {
    /* emit EventName(); calls event explicity. The below changes the state of the item to "Shipped". */
    emit Shipped(sku);

    items[sku].state = uint(State.Shipped);
  }


  function receiveItem(uint sku)
    public
    /* Modifer checks if item is shipped already. */
    shipped(sku)

    /* Modifier checks if the person calling function shipItem is the buyer.*/
    verifyCaller(items[sku].buyer)

    {
      /* emit EventName(); calls event explicity. The below changes the state of the item to "Received". */
      emit Received(sku);

      items[sku].state = uint(State.Received);
    }

  /* We have these functions completed so we can run tests, just ignore it :) */
  function fetchItem(uint _sku) public view returns (string name, uint sku, uint price, uint state, address seller, address buyer) {
    name = items[_sku].name;
    sku = items[_sku].sku;
    price = items[_sku].price;
    state = uint(items[_sku].state);
    seller = items[_sku].seller;
    buyer = items[_sku].buyer;
    return (name, sku, price, state, seller, buyer);
  }

}
