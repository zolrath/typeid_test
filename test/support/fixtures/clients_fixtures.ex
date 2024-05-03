defmodule TypeidTest.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TypeidTest.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> TypeidTest.Clients.create_client()

    client
  end
end
