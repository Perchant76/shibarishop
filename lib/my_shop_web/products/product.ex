defmodule MyShop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :category, :string
    field :price, :decimal
    field :image_url_1, :string
    field :image_url_2, :string
    field :image_url_3, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :category, :price, :image_url_1, :image_url_2, :image_url_3])
    |> validate_required([:name, :price])
  end
end
