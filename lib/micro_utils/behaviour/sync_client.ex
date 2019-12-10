defmodule MicroUtils.Behaviour.SyncClient do
  @callback call(binary(), Keyword.t()) :: any()
end
