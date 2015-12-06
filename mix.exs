defmodule Mandrake.Mixfile do
  use Mix.Project

  @version "0.0.4"

  def project do
    [app: :mandrake,
     version: @version,
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     name: "Mandrake",
     docs: [source_ref: "v#{@version}", main: "api-reference", logo: "logo.png"],
     source_url: "https://github.com/mbasso/mandrake",
     homepage_url: "https://github.com/mbasso/mandrake",
     package: package,
     description: """
     Mandrake is a functional programming library that bring something else magic in elixir.
     """]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
     {:inch_ex, only: :docs}]
  end

  defp package do
    [ 
      name: "mandrake", 
      maintainers: ["Matteo Basso"], 
      licenses: ["MIT"], 
      links: %{"GitHub" => "https://github.com/mbasso/mandrake", "Docs" => "http://hexdocs.pm/mandrake" }
    ]
  end

end
