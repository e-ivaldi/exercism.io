defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn(c) -> c==nucleotide end )
  end
  
  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    # there should be a better way
    map = Map.new()
    map = Map.put(map, ?A, count(strand, ?A))
    map = Map.put(map, ?T, count(strand, ?T))
    map = Map.put(map, ?C, count(strand, ?C))
    map = Map.put(map, ?G, count(strand, ?G))
  end
end
