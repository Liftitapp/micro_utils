defmodule MicroUtils.HTTP.SyncServer do
  defmacro __using__(opts) do
    subrouter = Keyword.fetch!(opts, :subrouter)

    quote do
      use MicroUtils.Behaviour.SyncServer,
        payload_type: map(),
        context_type: Plug.Conn.t(),
        return_type: Plug.Conn.t()

      import Plug.Conn

      def execute(conn, %{"path" => path} = payload) do
        mod = Map.get(unquote(subrouter), path)

        if mod == nil do
          # 404
          conn
          |> put_status(:not_found)
          |> halt()
        else
          apply(mod, :execute, [payload, conn])
        end
      end
    end
  end
end
