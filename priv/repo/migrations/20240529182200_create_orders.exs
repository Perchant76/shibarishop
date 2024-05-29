defmodule MyShop.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :email ,:string
      add :firstName ,:string
      add :lastName ,:string
      add :companyName ,:string
      add :address1line, :string
      add :city ,:string
      add :state, :string
      add :zipPostal ,:string
      add :country ,:string
      add :phoneNumber ,:string
      add :address, :string
      add :note ,:text
      add :total_price, :decimal
      add :paid_online, :boolean, default: false

      timestamps()
    end
  end
end
