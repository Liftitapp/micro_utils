defmodule TestController do
  use Phoenix.Controller, namespace: Test

  defmodule Pipeline do
    def respond_json(%{status: :ok, response: response}, conn) do
      res =
        conn
        |> put_status(:ok)
        |> json(response)

      [res]
    end
  end

  use MicroUtils.HTTP.SyncServer,
    subrouter: %{"service_one" => TestController.TestService},
    after_funcs: [&TestController.Pipeline.respond_json/2]

  defmodule TestService do
    def execute(_params, conn) do
      [%{status: :ok, response: %{}}, conn]
    end
  end
end
