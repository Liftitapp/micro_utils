defmodule TestRouter do
  use Phoenix.Router
  use Plug.ErrorHandler

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)
    match(:*, "/:path", TestController, :execute)
  end
end
