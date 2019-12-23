use Mix.Config

# Configure your database
config :lyrical_elixir, LyricalElixir.Repo,
  username: "root",
  password: "",
  database: "lyrical_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :lyrical_elixir, LyricalElixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
