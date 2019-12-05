defmodule MicroUtils.AMQP.AsyncClient do
  @behaviour MicroUtils.Behaviour.AsyncClient
  alias GenAMQP.Client

  def publish(payload, args) do
    conn_name = Keyword.fetch!(args, :conn_name)
    queue = Keyword.fetch!(args, :queue)
    Client.publish_with_conn(conn_name, "", queue, payload)
  end
end
