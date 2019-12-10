defmodule TestController do
  use Phoenix.Controller, namespace: Test
  use MicroUtils.HTTP.SyncServer, subrouter: %{"service_one" => TestController.TestService}

  defmodule TestService do
    def execute(_params, conn) do
      conn
      |> put_status(:ok)
      |> json(%{})
    end
  end
end
