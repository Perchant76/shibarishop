defmodule MyShopWeb.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", MyShopWeb do
    pipe_through :browser

    get "/cart", CartController, :show
    post "/cart/add/:product_id", CartController, :add
    post "/cart/remove/:product_id", CartController, :remove
    post "/cart/update/:product_id", CartController, :update
  end

end
