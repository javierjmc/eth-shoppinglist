pragma solidity ^0.5.16;

contract ShoppingList {
  struct Item {
    uint id;
    uint quantity;
    string name;
    bool checked;
  }

  Item[] public items;
  uint public nextId = 0;

  function addItem(string memory name, uint quantity) public {
    items.push(Item(nextId, quantity, name, false));
    nextId++;
  }

  function toggleItemCheck(uint id) public {
    Item storage item = items[findItemIndex(id)];
    item.checked = !item.checked;
  }

  function findItemIndex(uint id) view internal returns(uint) {
    for(uint i = 0; i < items.length ; i++) {
      if(items[i].id == id){
        return i;
      }
    }
    revert('Item does not exist');
  }

  function clearList() public {
    delete items;
  }

}
