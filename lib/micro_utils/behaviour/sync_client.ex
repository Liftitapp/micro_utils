defmodule MicroUtils.Behaviour.SyncClient do
  @callback call(any(), map()) :: {:reply, any()}
end
