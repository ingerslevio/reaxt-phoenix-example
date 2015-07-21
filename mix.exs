defmodule ReaxtPhoenixExample.Mixfile do
  use Mix.Project

  def project do
    [app: :reaxt_phoenix_example,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :reaxt_webpack] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    dev_apps = Mix.env == :dev && [:reprise] || []
    [mod: {ReaxtPhoenixExample, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :reaxt] ++ dev_apps]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.14"},
     {:phoenix_html, "~> 1.1"},
     {:phoenix_live_reload, "~> 0.4", only: :dev},
     {:cowboy, "~> 1.0"},
     {:reaxt, "~> 0.3.0"},
     {:reprise, "~> 0.3.0", only: :dev}]
  end
end
