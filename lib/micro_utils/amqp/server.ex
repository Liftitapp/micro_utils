defmodule MicroUtils.AMQP.Server do
  # opts can receive the :before and :after keys in order to execute
  # operations after and before the execute function be called
  defmacro __using__(opts) do
    opts =
      if Keyword.get(opts, :use_dlx, false) do
        dlx_name = Application.get_env(:gen_amqp, :dlx_name)
        max_queue_time = Application.get_env(:gen_amqp, :max_queue_time)
        Keyword.put(opts, :extra_args, use_dlx(dlx_name, max_queue_time))
      else
        opts
      end

    quote do
      # @behaviour MicroUtils.Behaviour.AsyncServer
      use GenAMQP.Server, unquote(opts)
    end
  end

  def use_dlx(dlx_name, max_queue_time)
      when not is_nil(dlx_name) and not is_nil(max_queue_time) do
    Keyword.new(%{
      :"x-dead-letter-exchange" => dlx_name,
      :"x-dead-letter-routing-key" => "",
      :"x-message-ttl" => max_queue_time
    })
  end

  def use_dlx(_dlx_name, _max_queue_time) do
    raise ArgumentError,
      message: "invalid argument for dlx_name or max_queue_time in gen_amqp config"
  end
end
