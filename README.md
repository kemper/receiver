# Receiver

This logs and responds with a shard id and http body

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add receiver to your list of dependencies in `mix.exs`:

        def deps do
          [{:receiver, "~> 0.0.1"}]
        end

  2. Ensure receiver is started before your application:

        def application do
          [applications: [:receiver]]
        end
