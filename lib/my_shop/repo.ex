defmodule MyShop.Repo do
  use Ecto.Repo,
    otp_app: :my_shop,
    adapter: Ecto.Adapters.Postgres
end
