defmodule Euler.Mixfile do
  use Mix.Project

  def project do
    [app: :euler,
     version: "0.0.1",
     elixir: "~> 0.14.3",
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      # {:rotor, "~> 0.2.1"}
    ]
  end

  defp description do
    """
    euler is a library that provides math functions.

    ## Features

    * Working with integers:
      * Greatest common divisor of two numbers (gcd)
    """
  end

  defp package do
    [
      contributors: ["Antoine Proulx"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/magicienap/euler"
      }
    ]
  end
end
