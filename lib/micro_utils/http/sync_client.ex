defmodule MicroUtils.HTTP.SyncClient do
  @behaviour MicroUtils.Behaviour.SyncClient

  def call(payload, args) do
    path = Keyword.fetch!(args, :path)
    base_url = Keyword.fetch!(args, :base_url)
    headers = Keyword.get(args, :headers, [])
    url = base_url <> "/" <> path
    HTTPoison.post(url, payload, headers)
  end
end
