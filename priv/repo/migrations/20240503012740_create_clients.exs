defmodule TypeidTest.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :text

      timestamps(type: :utc_datetime)
    end
  end
end
