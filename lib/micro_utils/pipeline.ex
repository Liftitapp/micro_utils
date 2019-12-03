defmodule MicroUtils.Pipeline do
  def make(func, before_funcs, after_funcs) do
    funcs = before_funcs ++ [func] ++ after_funcs

    fn args ->
      reduce_with_funcs(args, funcs)
    end
  end

  defp reduce_with_funcs(args, funcs) do
    Enum.reduce(funcs, args, fn f, acc ->
      apply(f, acc)
    end)
  end
end
