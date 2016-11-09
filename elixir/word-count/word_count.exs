defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    clean_sentence = Regex.replace(~r/\$|_|,|!|&|%|:|\^|@/, sentence, " ")
    list = String.split(clean_sentence, " ", trim: true )
    
    Enum.reduce list, %{}, fn ele,acc ->
      word = String.downcase(ele)
      resp = Map.fetch(acc, word)
      case resp do
        :error -> Map.put acc, word, 1   
        {:ok, val} -> Map.put acc, word, val+1 
      end
    end
    
  end
end
