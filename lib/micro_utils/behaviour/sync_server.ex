defmodule MicroUtils.Behaviour.SyncServer do
  defmacro __using__(opts) do
    payload_type = Keyword.fetch!(opts, :payload_type)
    context_type = Keyword.fetch!(opts, :context_type)
    return_type = Keyword.fetch!(opts, :return_type)

    quote do
      @type payload :: unquote(payload_type)
      @type context :: unquote(context_type)
      @callback execute(payload(), context()) :: unquote(return_type)
    end
  end
end
