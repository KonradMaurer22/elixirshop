defmodule View do

  def viewCartState(cart) do
    events = Shoppingcart.get(cart)
    reduce(Enum.reverse(events), [])
  end

  def handleEvent(cartstate, event) do
    case event do
      {:add, product} -> [product | cartstate]
      {:remove, product} ->
        IO.inspect cartstate
        removeFirst(cartstate, [], product)
    end
  end

  def reduce([], cartstate) do
    cartstate
  end

  def reduce([event | events], cartstate) do
    reduce(events, handleEvent(cartstate, event))
  end

  def removeFirst([product | products], cartstate, item_to_remove) do
    cond do
      product == item_to_remove ->
          removeFirst([], products ++ cartstate, item_to_remove)
      product != item_to_remove ->
          removeFirst(products, [product | cartstate], item_to_remove)
    end
  end

  def removeFirst([], cartstate, _) do
    Enum.reverse(cartstate)
  end

  def cartStateToString do
    # events = Shoppingcart.get(cart)
    # ordered = Enum.reverse events
    # stringlist = Enum.map ordered, fn item -> to_string(item) end
    # joinedlist = Enum.join stringlist, "\n"
  end

end
