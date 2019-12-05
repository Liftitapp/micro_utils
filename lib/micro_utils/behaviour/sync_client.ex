defmodule MicroUtils.Behaviour.SyncClient do
  @callback call(binary(), Keyword.t()) :: {:reply, any()}
end
