defmodule MyShopWeb.CartController do
  use MyShopWeb, :controller
  alias MyShop.Cart

  def add(conn, %{"product_id" => product_id}) do
    cart = Cart.fetch_cart(conn)
    updated_cart = Cart.add_item(cart, product_id)

    conn
    |> put_session("cart", updated_cart)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def remove(conn, %{"product_id" => product_id}) do
    cart = Cart.fetch_cart(conn)
    updated_cart = Cart.remove_item(cart, product_id)

    conn
    |> put_session("cart", updated_cart)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def update(conn, %{"product_id" => product_id, "quantity" => quantity}) do
    quantity = String.to_integer(quantity)
    cart = Cart.fetch_cart(conn)
    updated_cart = Cart.update_item(cart, product_id, quantity)

    conn
    |> put_session("cart", updated_cart)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def show(conn, _params) do
    cart = Cart.fetch_cart(conn)
    render(conn, "show.html", cart: cart)
  end
end
