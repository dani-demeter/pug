defmodule Server.MixProject do
  use Mix.Project

  def project do
    [
      app: :server,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: { Server.Supervisor, [] }
    ]
  end

  defp deps do
    [
      { :plug_cowboy, "~> 2.0" },
      { :poison, "~> 4.0" }
    ]
  end
end
