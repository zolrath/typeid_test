defmodule TypeidTest.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, TypeID, autogenerate: true, prefix: "client", type: :binary_id}
  @foreign_key_type TypeID

  schema "clients" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
