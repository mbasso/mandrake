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
  
  def application do
    [applications: [:logger]]
  end

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
