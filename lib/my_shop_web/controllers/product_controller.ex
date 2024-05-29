defmodule MyShopWeb.ProductController do
  use MyShopWeb, :controller
  alias MyShop.Cart

  def add_to_cart(conn, %{"product_id" => product_id}) do
    product_id = String.to_integer(product_id)
    cart = Cart.fetch_cart(conn)
    updated_cart = Cart.add_item(cart, product_id)
    conn
    |> put_session(:cart, updated_cart)
    |> redirect(to: Routes.product_path(conn, :show, product_id))
  end

  def remove_from_cart(conn, %{"product_id" => product_id}) do
    product_id = String.to_integer(product_id)
    cart = Cart.fetch_cart(conn)
    updated_cart = Cart.remove_item(cart, product_id)
    conn
    |> put_session(:cart, updated_cart)
    |> redirect(to: Routes.cart_path(conn, :show))
  end
end
