const ShoppingList = artifacts.require('ShoppingList');


contract('ShoppingList', () => {
  let shoppingList = null;

  before(async () => {
    shoppingList = await ShoppingList.deployed();
  });

  it('When addItem, should add the item marked as non-checked', async () => {
    await shoppingList.addItem("tomato", 2);
    let item = await shoppingList.items[0];

    assert(item.quantity.toNumber() === 2);
    assert(item.name === 'tomato');
    assert(item.checked === false);
  })

});
