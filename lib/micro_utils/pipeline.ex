defmodule MicroUtils.Pipeline do
  def make(func, before_funcs, after_funcs) do
    funcs = before_funcs ++ [func] ++ after_funcs
    &reduce_with_funcs(&1, funcs)
  end

  defp reduce_with_funcs(args, funcs) do
    Enum.reduce(funcs, args, &apply(&1, &2))
  end
end
