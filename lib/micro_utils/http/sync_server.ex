defmodule MicroUtils.HTTP.SyncServer do
  defmacro __using__(opts) do
    subrouter = Keyword.fetch!(opts, :subrouter)
    before_funcs = Keyword.get(opts, :before_funcs, [])
    after_funcs = Keyword.get(opts, :after_funcs, [])

    quote do
      use MicroUtils.Behaviour.SyncServer,
        payload_type: map(),
        context_type: Plug.Conn.t(),
        return_type: Plug.Conn.t()

      alias MicroUtils.Pipeline
      import Plug.Conn

      def execute(conn, %{"path" => path} = payload) do
        mod = Map.get(unquote(subrouter), path)

        if mod == nil do
          # 404
          conn
          |> put_status(:not_found)
          |> halt()
        else
          exec_func = fn payload, conn ->
            apply(mod, :execute, [payload, conn])
          end

          Pipeline.make(exec_func, unquote(before_funcs), unquote(after_funcs)).([payload, conn])
        end
      end
    end
  end
end
