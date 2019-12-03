defmodule MicroUtils.Behaviour.SyncServer do
  @callback execute(any(), map()) :: {:reply, any()}
end
