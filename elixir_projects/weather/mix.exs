defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      version: "0.1.0",
      elixir: "~> 1.17",
      name: "weather",
      source_url:
        "https://github.com/THOTH0101/elixir_practices/tree/main/elixir_projects/weather",
      escript: escript_config(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~> 2.2"},
      {:sweet_xml, "~> 0.7.4"},
      {:ex_doc, "~> 0.34.2"},
      {:earmark, "~> 1.4"}
    ]
  end

  defp escript_config do
    [
      main_module: Weather
    ]
  end
end
