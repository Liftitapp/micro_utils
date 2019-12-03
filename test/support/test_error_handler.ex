defmodule TestErrorHandler do
  def handle(kind, reason, stacktrace) do
    handle(Exception.normalize(kind, reason, stacktrace), stacktrace)
  end

  def handle(error, _stacktrace) do
    {:reply, inspect(error)}
  end
end
