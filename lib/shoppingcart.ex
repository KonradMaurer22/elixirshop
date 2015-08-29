defmodule Shoppingcart do

  def start_link do
    Agent.start_link(fn -> [] end)
  end

  def update(cart, product) do
    Agent.update(cart, fn list -> [product | list] end)
  end

  def get(cart) do
    Agent.get(cart, fn(list) -> list end)
    
  end

end
