defmodule MicroUtils.Behaviour.AsyncClient do
  @callback publish(any(), Keyword.t()) :: :noreply
end
