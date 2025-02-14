defmodule Newchat.Repo do
  use Ecto.Repo,
    otp_app: :newchat,
    adapter: Ecto.Adapters.Postgres
end
