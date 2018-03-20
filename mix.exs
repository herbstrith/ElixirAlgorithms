defmodule Algorithms.MixProject do
  use Mix.Project

  def project do
    [
      app: :algorithms,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :dev,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def description do
    "Classic CS Algorithms in Elixir"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
