defmodule MicroUtils.Behaviour.SyncServer do
  @type payload :: any()
  @type context :: map()

  @callback execute(payload(), context()) :: {:reply, any()}
end
