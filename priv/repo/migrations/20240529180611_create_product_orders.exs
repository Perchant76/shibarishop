defmodule MyShop.Repo.Migrations.CreateProductOrders do
  use Ecto.Migration

  def change do
    create table(:product_orders) do
      add :order_id, references(:orders)
      add :product_id, references(:products)
      add :quantity, :integer
      add :price_at_purchase, :decimal

      timestamps()
    end
  end
end
