defmodule ViewTest do
  use ExUnit.Case

  test "removeFirst function" do
    stuff = [:paper, :pens, :ponies, :thunder]
    assert View.removeFirst(stuff, [], :thunder) == [:paper, :pens, :ponies]
  end

  test "removeFirst function" do
    stuff = [:pens, :paper]
    assert View.removeFirst(stuff, [], :pens) == [:paper]
  end

  test "projects list" do
    {:ok, cart} = Shoppingcart.start_link
    assert View.viewCartState(cart) == []
    Shoppingcart.update(cart,{:add, :pens})
    assert View.viewCartState(cart) == [:pens]
    Shoppingcart.update(cart,{:add, :paper})
    assert View.viewCartState(cart) == [:paper, :pens]
  end

  test "does not show removed items" do
    {:ok, cart} = Shoppingcart.start_link
    assert View.viewCartState(cart) == []
    Shoppingcart.update(cart,{:add, :pens})
    assert View.viewCartState(cart) == [:pens]
    Shoppingcart.update(cart,{:add, :paper})
    assert View.viewCartState(cart) == [:paper, :pens]
    Shoppingcart.update(cart,{:remove, :pens})
    assert View.viewCartState(cart) == [:paper]
  end

end
