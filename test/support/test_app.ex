defmodule TestApp do
  @moduledoc false

  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    # Define supervisors and child supervisors to be supervised
    children = [
      supervisor(TestServers.NothingServer, []),
      supervisor(TestEndpoint, [])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
