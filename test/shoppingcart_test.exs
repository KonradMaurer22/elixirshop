defmodule ShoppingcartTest do
  use ExUnit.Case

  test "adding event to shopping cart" do
    {:ok, cart} = Shoppingcart.start_link
    Shoppingcart.update(cart, :pens)
    assert Shoppingcart.get(cart) == [:pens]
  end
end
