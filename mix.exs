defmodule MicroUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :micro_utils,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    if Mix.env() == :test do
      [extra_applications: [:logger], mod: {TestApp, []}]
    else
      [
        applications: []
      ]
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      {:plug, "~> 1.8"},
      {:httpoison, "~> 1.6"},
      {:gen_amqp, "~> 7.0.0"},
      {:jason, "~> 1.1", only: :test},
      {:phoenix, "~> 1.4", only: :test},
      {:plug_cowboy, "~> 2.1", only: :test},
      {:mock, "~> 0.3.4", only: :test}
    ]
  end
end
