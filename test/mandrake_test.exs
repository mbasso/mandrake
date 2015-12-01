ExUnit.start()

defmodule MandrakeTest do
  use ExUnit.Case, async: true
  doctest Mandrake
  doctest Mandrake.Math
  doctest Mandrake.Function
  doctest Mandrake.Logic
  doctest Mandrake.List
  doctest Mandrake.Relation
  doctest Mandrake.Type
  #doctest Mandrake.DateTime
  doctest Mandrake.Annotation
end
