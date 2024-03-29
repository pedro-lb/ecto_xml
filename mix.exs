defmodule EctoXml.MixProject do
  use Mix.Project

  @source_url "https://github.com/pedro-lb/ecto_xml"

  def project do
    [
      app: :ecto_xml,
      version: "1.0.1",
      elixir: "~> 1.12",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  defp description do
    """
    EctoXml provides a way to easily generate XML documents from Ecto Schemas and maps.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Pedro Bini"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pedro-lb/ecto_xml"}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: ["README.md"]
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
      {:xml_builder, "~> 2.1"},
      # Dev & Test
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:phoenix_ecto, "~> 4.1", only: [:dev, :test]},
      {:ex_doc, "~> 0.24.2", only: :dev},
      # Test
      {:excoveralls, "~> 0.14.0", only: :test}
    ]
  end
end
