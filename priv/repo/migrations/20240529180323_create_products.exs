defmodule MyShop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text
      add :category, :string
      add :price, :decimal
      add :image_url_1, :string
      add :image_url_2, :string
      add :image_url_3, :string

      timestamps()
    end
  end
end
