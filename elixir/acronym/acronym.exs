defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    list = String.split(Regex.replace(~r/-|[a-z](?=[A-Z])/, string, " \\1"))
    List.to_string(Enum.reverse(abbreviate(list, [])))
  end

  defp abbreviate([], result) do
    result
  end      

  defp abbreviate([x], result) do
    [first_char_to_uppercase(x) | result]
  end

  defp abbreviate([h|t], result) do
    abbreviate(t, [first_char_to_uppercase(h) |  result])
  end  

  defp first_char_to_uppercase(string) do
    String.upcase(String.at(string,0))
  end

end
