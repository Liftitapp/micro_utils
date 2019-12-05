defmodule MicroUtils.Behaviour.AsyncClient do
  @callback publish(binary(), Keyword.t()) :: :noreply
end
