defmodule Hermeneutics.Repo do
  use Ecto.Repo,
    otp_app: :hermeneutics,
    adapter: Ecto.Adapters.SQLite3
end
