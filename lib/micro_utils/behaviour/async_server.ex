defmodule MicroUtils.Behaviour.AsyncServer do
  @callback execute(any(), map()) :: :noreply
end
