defmodule Ask.Repo do
  use Ecto.Repo,
    otp_app: :ask,
    adapter: Ecto.Adapters.Postgres
end
