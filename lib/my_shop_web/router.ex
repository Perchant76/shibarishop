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

    resources "/products", ProductController, only: [:index, :show, :new, :create, :edit, :update, :delete] do
      post "/add_to_cart", ProductController, :add_to_cart, as: :add_to_cart
      post "/remove_from_cart", ProductController, :remove_from_cart, as: :remove_from_cart
    end
    get "/cart", CartController, :show
  end
end
