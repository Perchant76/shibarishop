defmodule MyShop.Cart do
  alias MyShop.Catalogue

  # Fetches the cart from the session and decodes it
  def fetch_cart(conn) do
    conn
    |> Plug.Conn.get_session("cart")
    |> decode_cart()
  end

  # Adds an item to the cart or increases its quantity
  def add_item(cart, product_id, quantity \\ 1) do
    update_cart(cart, product_id, quantity, &(&1 + quantity))
  end

  # Removes an item from the cart
  def remove_item(cart, product_id) do
    cart |> Map.drop([product_id])
  end

  # Updates the quantity of an item in the cart
  def update_item(cart, product_id, quantity) do
    update_cart(cart, product_id, quantity, fn _ -> quantity end)
  end

  # Helper function to add, remove, or update items in the cart
  defp update_cart(cart, product_id, quantity, func) do
    current_quantity = Map.get(cart, product_id, 0)
    new_quantity = func.(current_quantity, quantity)

    if new_quantity > 0 do
      Map.put(cart, product_id, new_quantity)
    else
      Map.delete(cart, product_id)
    end
  end

  # Decodes the cart from session; ensures it returns a map
  defp decode_cart(nil), do: %{}
  defp decode_cart(cart), do: cart

  # Calculates the total price of all items in the cart
  def total_price(cart) do
    Enum.reduce(cart, 0, fn {id, qty}, acc ->
      case Catalogue.get_product(id) do
        nil -> acc
        %Catalogue.Product{price: price} -> acc + price * qty
      end
    end)
  end
end
