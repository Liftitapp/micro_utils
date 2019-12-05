defmodule MicroUtils.Behaviour.AsyncServer do
  @type payload :: any()
  @type context :: map()

  @callback execute(payload(), context()) :: :noreply
end
