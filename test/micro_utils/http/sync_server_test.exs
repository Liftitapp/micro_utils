defmodule MicroUtils.HTTP.SyncServerTest do
  use ExUnit.Case
  alias MicroUtils.HTTP.SyncClient
  import Mock

  test "call the execute function via http sync" do
    assert {:ok, %HTTPoison.Response{status_code: 200, body: "{}"}} =
             %{name: "Demo"}
             |> Jason.encode!()
             |> SyncClient.call(
               base_url: "http://localhost:4000",
               path: "service_one",
               headers: ["content-type": "application/json"]
             )
  end
end
