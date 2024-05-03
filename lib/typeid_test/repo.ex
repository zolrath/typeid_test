defmodule TypeidTest.Repo do
  use Ecto.Repo,
    otp_app: :typeid_test,
    adapter: Ecto.Adapters.Postgres
end
