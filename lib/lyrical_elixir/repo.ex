defmodule LyricalElixir.Repo do
  use Ecto.Repo,
    otp_app: :lyrical_elixir,
    adapter: Ecto.Adapters.MyXQL
end
