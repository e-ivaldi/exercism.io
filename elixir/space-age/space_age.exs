defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_age = seconds / 3600 / 24 / 365.25 
    case planet do
      :earth    -> earth_age
      :mercury  -> earth_age / 0.2408467
      :venus    -> earth_age / 0.61519726
      :mars     -> earth_age / 1.8808158
      :jupiter  -> earth_age / 11.862615
      :saturn   -> earth_age / 29.447498
      :uranus   -> earth_age / 84.016846
      :neptune  -> earth_age / 164.79132
    end
  end
end
