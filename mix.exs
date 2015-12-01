defmodule Mandrake.Mixfile do
  use Mix.Project

  def project do
    [app: :Mandrake,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     name: "Mandrake",
     docs: [source_ref: "v#{@version}", main: "Mandrake", logo: "logo.png"],
     source_url: "https://github.com/mbasso/mandrake",
     homepage_url: "http://www.mandrake.teamturkeys.com",
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
     {:ex_doc, "~> 0.11", only: :dev}]
  end
end
