defmodule ParliamentBot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :parliament_bot,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      mod: {ParliamentBot.Application, []},
      extra_applications: [:gen_state_machine, :gproc, :logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:gen_state_machine, "~> 2.0"},
      {:gettext, "~> 0.11"},
      {:gproc, "0.3.1"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:slack, "~> 0.12.0"}
    ]
  end
end
