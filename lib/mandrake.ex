defmodule Mandrake do

  @moduledoc """
  Mandrake is a functional programming library that bring something else magic in elixir. Facility, prosperity and maintainability are Mandrake characteristics. Mandrake contains mathematical, logical, relational and functional API that helps developers in their daily work.
  
  ## What is a Mandrake?

  Element: Fire

  Planet: Mercury, Uranus and Pluto.

  Powers: Protection, Fertility, Money, Love, Health

  Mandrake is a long leafed dark green plant with small greenish-yellow or purple bell-shaped flowers. The flowers eventually fruit into small orange-coloured fleshy berries.
  Magically speaking, the female mandrake carries forked that look like a pair of human legs, whereas the male has only a single root.
  In the old Herbals we find them frequently figured as a male with a long beard, and a female with a very bushy head of hair.
  The female form is the most sought after for magic and medicinal use.
  A whole Mandrake root placed in the home, will give the house protection, fertility, and prosperity. Also, where there is Mandrake, demons cannot abide. Money placed beside the root is said to multiply.

  Source: http://monsters.monstrous.com/mandrake.htm

  """

  defmacro __using__(_opts) do
    quote do
        import Mandrake
    end
  end

  defmodule Math do

    @moduledoc """
    Mandrake mathematical functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Math
      end
    end

    @doc """
    Calculates the sum of a list of numbers.

    ## Examples

        iex> Mandrake.Math.sum([1, 2, 3, 4, 5])
        15

    """
    def sum([head|tail]) do
      head + sum(tail)
    end

    def sum([]) do
      0
    end

    @doc """
    Calculates the mean of a list of numbers.

    ## Examples

        iex> Mandrake.Math.mean([1, 2, 3, 4, 5])
        3.0

    """
    def mean(list) do
      sum(list) / (length list)
    end

    @doc """
    Calculates the product of a list of numbers.

    ## Examples

        iex> Mandrake.Math.product([1, 2, 3, 4, 5])
        120

    """
    def product([head|tail]) do
      head * product(tail)
    end

    def product([]) do
      1
    end

    @doc """
    Calculates the absolute value of each number in a list.

    ## Examples

        iex>  Mandrake.Math.abs([-1, 2, -3, -4, -5])
        [1, 2, 3, 4, 5]

    """
    def abs([head|tail]) do
      [ Kernel.abs(head) | __MODULE__.abs(tail) ]
    end

    def abs([]) do
      []
    end

    @doc """
    Returns max value in a list.

    ## Examples

        iex>  Mandrake.Math.max([1, 243, 3, 4, 5])
        243

    """
    def max([head|tail]) when (length tail) > 1 do
      Kernel.max(head, __MODULE__.max(tail))
    end

    def max([head|tail]) when (length tail) == 1 do
      Kernel.max(head, List.first(tail))
    end

    @doc """
    Returns min value in a list.

    ## Examples

        iex>  Mandrake.Math.min([1, 243, 3, 4, 5])
        1

    """
    def min([head|tail]) when (length tail) > 1 do
      Kernel.min(head, __MODULE__.min(tail))
    end

    def min([head|tail]) when (length tail) == 1 do
      Kernel.min(head, List.first(tail))
    end

    @doc """
    Adds two numbers.

    ## Examples

        iex>  Mandrake.Math.add(5, 2)
        7

    """
    def add(first_number, second_number) do
      first_number + second_number
    end

    @doc """
    Returns a function that adds a number to the first.

    ## Examples

        iex>  add2 = Mandrake.Math.add(2)
        ...>  add2.(5)
        7

    """
    def add(number) do
      fn arg -> add(number, arg) end
    end

    @doc """
    Subtracts two numbers.

    ## Examples

        iex>  Mandrake.Math.subtract(5, 2)
        3

    """
    def subtract(first_number, second_number) do
      first_number - second_number
    end

    @doc """
    Returns a function that subtracts a number to the first.

    ## Examples

        iex>  subtract2 = Mandrake.Math.subtract(2)
        ...>  subtract2.(5)
        -3

    """
    def subtract(number) do
      fn arg -> subtract(number, arg) end
    end

    @doc """
    Decrease a number by 1.

    ## Examples

        iex>  Mandrake.Math.dec(7)
        6

    """
    def dec(number) do
      number - 1
    end
    
    @doc """
    Increase a number by 1.

    ## Examples

        iex>  Mandrake.Math.inc(7)
        8

    """
    def inc(number) do
      number + 1
    end

    @doc """
    Divides two numbers.

    ## Examples

        iex>  Mandrake.Math.divide(5, 2)
        2.5

    """
    def divide(first_number, second_number) do
      first_number / second_number
    end

    @doc """
    Returns a function that divides a number to the first.

    ## Examples

        iex>  divide2 = Mandrake.Math.divide(2)
        ...>  divide2.(5)
        0.4

    """
    def divide(number) do
      fn arg -> divide(number, arg) end
    end
    
    @doc """
    Multiplies two numbers.

    ## Examples

        iex>  Mandrake.Math.multiply(5, 2)
        10

    """
    def multiply(first_number, second_number) do
      first_number * second_number
    end

    @doc """
    Returns a function that multiplies a number to the first.

    ## Examples

        iex>  multiply2 = Mandrake.Math.multiply(2)
        ...>  multiply2.(5)
        10

    """
    def multiply(number) do
      fn arg -> multiply(number, arg) end
    end

    @doc """
    Returns modulus of two numbers.

    ## Examples

        iex>  Mandrake.Math.modulo(20, 5)
        0

    """
    def modulo(first_number, second_number) do
      Kernel.rem(first_number, second_number)
    end

    @doc """
    Negate a number.

    ## Examples

        iex>  Mandrake.Math.negate(7)
        -7

    """
    def negate(number) do
      -number
    end

    @doc """
    Calculates the median of a list of numbers.

    ## Examples

        iex> Mandrake.Math.median([7, 2, 10, 9, 6])
        7
        iex> Mandrake.Math.median([7, 2, 10, 9, 6, 8])
        7.5

    """
    def median(list) do
      list = Enum.sort(list)
      if modulo((length list), 2) == 0 do
        (Enum.at(list,((length list) -1) |> div 2) + Enum.at(list,((length list) +1) |> div 2)) / 2
      else
        Enum.at(list,((length list) -1) |> div 2)
      end
    end

  end

  defmodule Function do

    @moduledoc """
    Mandrake functional functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Function
      end
    end

    def build_args(string, remaining) do
        if remaining == 0 do
            string
        else
            build_args(string <> ", arg" <> to_string(remaining), remaining-1)
        end
    end

    @doc """
    Apply the second argument to the function.

    ## Examples

        iex>  mod = Mandrake.Function.apply(fn arg -> -arg end, -2)
        2
        
    """
    def apply(function, value) do
        function.(value)
    end

    @doc """
    Returns an anonymous function that wrap the given.

    ## Examples

        iex>  mod = Mandrake.Function.lambda("Mandrake.Math.modulo", 2)
        ...>  mod.(20, 5)
        0
        
    """
    def lambda(function, arity) do
        args = cond do
            arity == 0 -> ""
            arity == 1 -> "arg"
            arity > 1 -> nil
        end
        if is_nil(args) do args = build_args("arg" <> to_string(arity), arity-1) end
        List.first(Tuple.to_list(Code.eval_string("fn " <> args <> " -> " <> function <> "(" <> args <> ") end")))
    end    

    @doc """
    Call the given function with the given object.

    ## Examples

        iex>  Mandrake.Function.tap(fn arg -> Mandrake.Math.inc(arg) end, 5)
        6
        
    """
    def tap(function, value) do
      function.(value)
    end

    @doc """
    Function that return always the given value.

    ## Examples

        iex>  printExample = Mandrake.Function.always("Example")
        ...>  printExample.()
        "Example"

    """
    def always(value) do
      fn -> value end
    end

    @doc """
    Function that do nothing

    ## Examples

        iex>  Mandrake.Function.noop()
        nil

    """
    def noop() do

    end

    @doc """
    Returns the composition of two functions.

    ## Examples

        iex>  printHello = Mandrake.Function.compose(fn x -> "Hello " <> to_string(x) end, fn y -> y + 1 end)
        ...>  printHello.(6)
        "Hello 7"

    """
    def compose(first_function, second_function) do
      fn arg -> first_function.(second_function.(arg)) end
    end

  end

  defmodule Logic do

    @moduledoc """
    Mandrake logical functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Logic
      end
    end

    @doc """
    Returns a function that return !result of the given function.

    ## Examples

        iex>  is_odd = Mandrake.Logic.complement(fn arg -> Kernel.rem(arg, 2) == 0 end)
        ...>  is_odd.(24)
        false

    """
    def complement(function) do
        fn arg -> logic_not(function.(arg)) end
    end

    @doc """
    Returns a function that process onTrue or onFalse depending upon the result of the condition.

    ## Examples

        iex>  my_number = 1
        ...>  my_function = Mandrake.Logic.ifElse(my_number <= 1, fn arg -> Mandrake.Math.inc(arg) end, fn arg -> Mandrake.Math.dec(arg) end)
        ...>  my_function.(my_number)
        2

    """
    def ifElse(condition, onTrue, onFalse) do
      fn arg -> if condition do onTrue.(arg) else onFalse.(arg) end end
    end

    @doc """
    Returns a function that process on_true if condition is true.

    ## Examples

        iex>  my_number = 1
        ...>  my_function = Mandrake.Logic.logic_if(my_number <= 1, fn arg -> Mandrake.Math.inc(arg) end)
        ...>  my_function.(my_number)
        2

    """
    def logic_if(condition, on_true) do
      fn arg -> if condition do on_true.(arg) end end
    end

    @doc """
    Returns true if both functions return true

    ## Examples

        iex>  my_function = Mandrake.Logic.both(fn x -> x > 10 end, fn x -> Kernel.rem(x, 2) == 0 end)
        ...>  my_function.(100)
        true
        iex>  my_function.(101)
        false

    """
    def both(first_func, second_func) do
      fn value -> first_func.(value) && second_func.(value) end
    end

    @doc """
    Returns true if one function return true

    ## Examples

        iex>  my_function = Mandrake.Logic.either(fn x -> x > 10 end, fn x -> Kernel.rem(x, 2) == 0 end)
        ...>  my_function.(100)
        true
        iex>  my_function.(101)
        true

    """
    def either(first_func, second_func) do
      fn value -> first_func.(value) || second_func.(value) end
    end

    @doc """
    Returns true if value is "", '', [], {} or %{}.

    ## Examples

        iex>  Mandrake.Logic.is_empty([])
        true
        iex>  Mandrake.Logic.is_empty(nil)
        false

    """
    def is_empty(value) do
      if value == [] || value == {} || value == "" || value == '' || value == %{} do
        true
      else
        false
      end
    end

    @doc """
    Returns true if both conditions are true.

    ## Examples

        iex>  Mandrake.Logic.logic_and(1<2, 3>4)
        false

    """
    def logic_and(first_cond, second_cond) do
      first_cond && second_cond
    end

    @doc """
    Returns true if one condition is true.

    ## Examples

        iex>  Mandrake.Logic.logic_or(1<2, 3>4)
        true

    """
    def logic_or(first_cond, second_cond) do
      first_cond || second_cond
    end

    @doc """
    Returns ! of value

    ## Examples

        iex>  Mandrake.Logic.logic_not(false)
        true

    """
    def logic_not(value) do
      !value
    end

    @doc """
    Returns the second argument if it is not nil.

    ## Examples

        iex>  default_to_7 = Mandrake.Logic.default_to(7)
        ...>  default_to_7.(nil)
        7
        iex>  default_to_7.(12)
        12

    """
    def default_to(value) do
      fn arg -> 
        if arg != nil do 
          arg
        else 
          value
        end
      end
    end

  end

  defmodule List do

    @moduledoc """
    Mandrake mathematical functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.List
      end
    end

    @doc """
    Returns a new list starting from the given value or nil.

    ## Examples

        iex>  Mandrake.List.reverse([4, 7, 43, 6, 3, 7])
        [7, 3, 6, 43, 7, 4]

    """
    def reverse([head|tail]) do
      reverse(tail) ++ [head]
    end

    def reverse([]) do
      []
    end

    @doc """
    Returns a new list starting from the given value or nil.

    ## Examples

        iex>  Mandrake.List.from(43, [4, 7, 43, 6, 3, 7])
        [43, 6, 3, 7]

    """
    def from(value, [head|tail]) do
      if head == value do
        [head|tail]
      else
        from(value, tail)
      end
    end

    def from(value, []) do

    end

    @doc """
    Returns true if all elements in a list are equal.

    ## Examples

        iex>  Mandrake.List.equals([7, 7, 7])
        true

    """
    def equals([head|tail]) when (length tail) > 1 do
      if head == Elixir.List.first(tail) do
        equals(tail)
      else
        false
      end
    end

    def equals([head|tail]) when (length tail) == 1 do
      head == Elixir.List.first(tail)
    end

    @doc """
    Returns a new list after appending the new element.

    ## Examples

        iex>  Mandrake.List.append(45, [4, 7, 43, 6, 3, 7])
        [4, 7, 43, 6, 3, 7, 45]

    """
    def append(element, list) do
      list ++ [element]
    end

    @doc """
    Returns a new list after prepending the new element.

    ## Examples

        iex>  Mandrake.List.prepend(45, [4, 7, 43, 6, 3, 7])
        [45, 4, 7, 43, 6, 3, 7]

    """
    def prepend(element, list) do
      [element] ++ list
    end

    @doc """
    Returns the best item in a list based on the return value for the iterator function.

    ## Examples

        iex>  longest = Mandrake.List.best(fn arg1, arg2 -> if arg1 > arg2 do arg1 else arg2 end end)
        ...>  longest.([4, 7, 43, 6, 3, 7])
        43

    """
    def best(function) do
      fn list -> best(function, list) end
    end

    @doc """
    Returns the best item in a list based on the return value for the iterator function.

    ## Examples

        iex>  Mandrake.List.best(fn arg1, arg2 -> if arg1 > arg2 do arg1 else arg2 end end, [4, 7, 43, 6, 3, 7])
        43

    """
    def best(function, [head|tail]) when (length tail) > 1 do
      function.(head, best(function, tail))
    end

    def best(function, [head|tail]) when (length tail) == 1 do
      function.(head, Elixir.List.first(tail))
    end

    @doc """
    Returns true if list contains the given value.

    ## Examples

        iex>  Mandrake.List.contains(3, [1, 2, 3, 4, 5])
        true

    """
    def contains(value, [head|tail]) do
      value == head || contains(value, tail)
    end

    def contains(value, []) do
      false
    end

    @doc """
    Returns the extension of the first list with the second.

    ## Examples

        iex>  Mandrake.List.union([1, 2, 3], [4, 5])
        [1, 2, 3, 4, 5]

    """
    def union(first_list, second_list) do
      first_list ++ second_list
    end

    @doc """
    Returns the difference of the 2 lists.

    ## Examples

        iex>  Mandrake.List.difference([1, 2, 3], [2])
        [1, 3]

    """
    def difference(first_list, second_list) do
      first_list -- second_list
    end

    @doc """
    Returns the intersection of the 2 lists.

    ## Examples

        iex>  Mandrake.List.intersection([1,2,3,4], [7,6,5,4,3])
        [3, 4]

    """
    def intersection(first_list, second_list) do
      first_list -- (first_list -- second_list)
    end

    @doc """
    Returns the last item of a list that returns true for the function.

    ## Examples

        iex>  Mandrake.List.last(fn x -> Kernel.rem(x, 2) == 0 end, [2, 4, 5, 7, 8, 9])
        8

    """
    def last(func, list) do
      list = Enum.reverse(list)
      first(func, list)
    end

    @doc """
    Returns the first item of a list that returns true for the function.

    ## Examples

        iex>  printHello = Mandrake.List.first(fn x -> Kernel.rem(x, 2) == 0 end, [2, 4, 5, 7])
        2

    """
    def first(func, [head|tail]) do
      if func.(head) do
        head
      else
        first(func, tail)
      end
    end

    def first(func, []) do
      []
    end

    @doc """
    Returns a list containing the given value.

    ## Examples

        iex>  Mandrake.List.of("Example")
        ["Example"]

    """
    def of(value) do
      [value]
    end

    @doc """
    Returns a new list without the given item.

    ## Examples

        iex>  Mandrake.List.delete([1, 2, 4, 3, 4, 5, 6], 4)
        [1, 2, 3, 5, 6]

    """
    def delete([head|tail], item) do
      if head != item do
        [ head ] ++ delete(tail, item)
      else
        delete(tail, item)
      end
    end

    def delete([], item) do
      []
    end

    @doc """
    Returns a new list without the given item.

    ## Examples

        iex>  delete_4 = Mandrake.List.delete(4)
        ...>  delete_4.([1, 2, 4, 3, 4, 5, 6])
        [1, 2, 3, 5, 6]

    """
    def delete(item) do
      fn list -> delete(list, item) end
    end

    @doc """
    Returns a list composed by the value of the properties for the given key from items in the given list.

    ## Examples

        iex>  pluck_example = Mandrake.List.pluck(:example)
        ...>  pluck_example.([%{ name: "Doe" }, %{ example: "first", name: "John" }, %{ example: "second" }])
        [ "first", "second" ]

    """
    def pluck(key) do
      fn list -> pluck(list, key) end
    end

    @doc """
    Returns a list composed by the value of the properties for the given key from items in the given list.

    ## Examples

        iex>  Mandrake.List.pluck([%{ name: "Doe" }, %{ example: "first", name: "John" }, %{ example: "second" }], :example)
        [ "first", "second" ]

    """
    def pluck([head|tail], key) do
      value = Map.get(head, key)
      if value != nil do
        [ value ] ++ pluck(tail, key)
      else
        pluck(tail, key)
      end
    end

    def pluck([], key) do
      []
    end

    @doc """
    Returns a new list after applying the given function to each element of the list.

    ## Examples

        iex>  Mandrake.List.for_each(fn x -> x + 1 end, [1, 2, 3])
        [2, 3, 4]

    """
    def for_each(function, [head|tail]) do
      [ function.(head) ] ++ for_each(function, tail)
    end

    def for_each(function, []) do
      []
    end

    @doc """
    Returns a list of items until the condition is true.

    ## Examples

        iex>  while_even = Mandrake.List.while(fn item -> Kernel.rem(item, 2) == 0 end)
        ...>  while_even.([2, 6, 7, 8, 10])
        [2, 6]

    """
    def while(function) do
      fn list -> while(function, list) end
    end

    @doc """
    Returns a list of items until the condition is true.

    ## Examples

        iex>  Mandrake.List.while(fn item -> Kernel.rem(item, 2) == 0 end, [2, 6, 7, 8, 10])
        [2, 6]

    """
    def while(function, [head|tail]) do
      if function.(head) do
        [ head ] ++ while(function, tail)
      else
        []
      end
    end

    def while(function, []) do
      []
    end

    @doc """
    Returns a new list with the only item that satisfy the given function.

    ## Examples

        iex>  select_even = Mandrake.List.select(fn item -> Kernel.rem(item, 2) == 0 end)
        ...>  select_even.([2, 6, 7, 8, 10])
        [2, 6, 8, 10]

    """
    def select(function) do
      fn list -> select(function, list) end
    end

    @doc """
    Returns the list of items that satisfy the condition.

    ## Examples

        iex>  Mandrake.List.select(fn item -> Kernel.rem(item, 2) == 0 end, [2, 6, 7, 8, 10])
        [2, 6, 8, 10]

    """
    def select(function, [head|tail]) do
      if function.(head) do
        [ head ] ++ select(function, tail)
      else
        select(function, tail)
      end
    end

    def select(function, []) do
      []
    end

    @doc """
    Returns a list of 2 lists. The first contains the elements that satisfy the function, other elements are in the second.

    ## Examples

        iex>  even = Mandrake.List.partition(fn item -> Kernel.rem(item, 2) == 0 end)
        ...>  even.([4, 7, 43, 6, 3, 7])
        [[4, 6], [7, 43, 3, 7]]

    """
    def partition(function) do
      fn list -> partition(function, list) end
    end

    @doc """
    Returns a list of 2 lists. The first contains the elements that satisfy the function, other elements are in the second.

    ## Examples

        iex>  Mandrake.List.partition(fn item -> Kernel.rem(item, 2) == 0 end, [4, 7, 43, 6, 3, 7])
        [[4, 6], [7, 43, 3, 7]]

    """
    def partition(function, list) do
      [ select(function, list), select(fn item -> !function.(item) end, list) ]
    end

  end

  defmodule Relation do

    @moduledoc """
    Mandrake relational functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Relation
      end
    end

    @doc """
    Returns the larger of two arguments.

    ## Examples

        iex>  Mandrake.Relation.max('a', 'z')
        'z'

    """
    def max(value_1, value_2) do
      if value_1 > value_2 do 
        value_1
      else 
        value_2 
      end
    end

    @doc """
    Returns the value that produces the larger result when passed to the provided function.

    ## Examples

        iex>  Mandrake.Relation.max_by(fn arg -> Mandrake.Math.negate(arg) end, -3, -6)
        -6

    """
    def max_by(function, value_1, value_2) do
      if function.(value_1) > function.(value_2) do 
        value_1
      else 
        value_2 
      end
    end

    @doc """
    Returns the smaller of two arguments.

    ## Examples

        iex>  Mandrake.Relation.min('a', 'z')
        'a'

    """
    def min(value_1, value_2) do
      if value_1 < value_2 do 
        value_1
      else 
        value_2 
      end
    end

    @doc """
    Returns the value that produces the smaller result when passed to the provided function.

    ## Examples

        iex>  Mandrake.Relation.min_by(fn arg -> Mandrake.Math.negate(arg) end, -3, -6)
        -6

    """
    def min_by(function, value_1, value_2) do
      if function.(value_1) > function.(value_2) do 
        value_1
      else 
        value_2 
      end
    end

    @doc """
    Returns true if the values produce the same result when passed to the provided function.

    ## Examples

        iex>  Mandrake.Relation.equals_by(fn arg -> Mandrake.Math.abs(arg) end, [-3], [3])
        true

    """
    def equals_by(function, value_1, value_2) do
      function.(value_1) == function.(value_2)
    end

    @doc """
    Returns true if the given values are equal.

    ## Examples

        iex>  Mandrake.Relation.equals('0', 0)
        false

    """
    def equals(value_1, value_2) do
      value_1 == value_2
    end

    @doc """
    Returns true if first value is less than the second.

    ## Examples

        iex>  Mandrake.Relation.lt(7, 5)
        false

    """
    def lt(first_value, second_value) do
      first_value < second_value
    end

    @doc """
    Returns true if first value is less than or equal to the second.

    ## Examples

        iex>  Mandrake.Relation.lte(7, 7)
        true

    """
    def lte(first_value, second_value) do
      first_value <= second_value
    end

    @doc """
    Returns true if first value is greater than the second.

    ## Examples

        iex>  Mandrake.Relation.gt(7, 5)
        true

    """
    def gt(first_value, second_value) do
      first_value > second_value
    end

    @doc """
    Returns true if first value is greater than or equal to the second.

    ## Examples

        iex>  Mandrake.Relation.gte(7, 7)
        true

    """
    def gte(first_value, second_value) do
      first_value >= second_value
    end

  end

  defmodule Validation do

    @moduledoc """
    Mandrake validation functions.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Validation
      end
    end

    @doc """
    Returns a boolean indicating whether there was a match or not.

    ## Examples

        iex>  Mandrake.Validation.test(~r/foo/, "foo")
        true

    """
    def test(regex, string) do
      Regex.match?(regex, string)
    end

    @doc """
    Returns a function that test the given regex.

    ## Examples

        iex>  testFoo = Mandrake.Validation.test(~r/foo/)
        ...>  testFoo.("bar")
        false

    """
    def test(regex) do
      fn string -> Regex.match?(regex, string) end
    end

    @doc """
    Returns always true.

    ## Examples

        iex>  Mandrake.Validation.anything("foo")
        true

    """
    def anything(string) do
      Regex.match?(~r/^.*$/, string)
    end

    @doc """
    Returns true if the given value is a valid email.

    ## Examples

        iex>  Mandrake.Validation.email("foo@bar.com")
        true

    """
    def email(string) do
      Regex.match?(~r/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/, string)
    end

    @doc """
    Returns true if the given value is a valid amount.

    ## Examples

        iex>  Mandrake.Validation.amount("0")
        true
        iex>  Mandrake.Validation.amount("0.00")
        true
        iex>  Mandrake.Validation.amount("0,00")
        true

    """
    def amount(string) do
      Regex.match?(~r/(?:^\d{1,3}(?:\.?\d{3})*(?:,\d{2})?$)|(?:^\d{1,3}(?:,?\d{3})*(?:\.\d{2})?$)/, string)
    end

    @doc """
    Returns true if the given value is a valid gender (m/M, f/F).

    ## Examples

        iex>  Mandrake.Validation.gender("m")
        true

    """
    def gender(string) do
      Regex.match?(~r/^[mfMF]$/, string)
    end

    @doc """
    Returns true if the given value is a valid year.

    ## Examples

        iex>  Mandrake.Validation.year("2015")
        true

    """
    def year(string) do
      Regex.match?(~r/^\d{4}$/, string)
    end

    @doc """
    Returns true if the given value is a valid number.

    ## Examples

        iex>  Mandrake.Validation.number("535")
        true

    """
    def number(string) do
      Regex.match?(~r/^\d+$/, string)
    end

    @doc """
    Returns true if the given value is a valid name.

    ## Examples

        iex>  Mandrake.Validation.name("Matteo Basso")
        true
        iex>  Mandrake.Validation.name("Martin Luther King, Jr.")
        true

    """
    def name(string) do
      Regex.match?(~r/^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/u, string)
    end

    @doc """
    Returns true if the given value is a valid phone number.

    ## Examples

        iex>  Mandrake.Validation.phone_number("(123) 456 7899")
        true
        iex>  Mandrake.Validation.phone_number("(123).456.7899")
        true
        iex>  Mandrake.Validation.phone_number("(123)-456-7899")
        true
        iex>  Mandrake.Validation.phone_number("123-456-7899")
        true
        iex>  Mandrake.Validation.phone_number("123 456 7899")
        true
        iex>  Mandrake.Validation.phone_number("1234567899")
        true

    """
    def phone_number(string) do
      Regex.match?(~r/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/, string)
    end

    @doc """
    Returns true if the given value is a valid username (letters, numbers, underscores, hyphens, 3 < username_length < 18).

    ## Examples

        iex>  Mandrake.Validation.username("mbasso")
        true

    """
    def username(string) do
      Regex.match?(~r/^[a-z0-9_-]{3,16}$/, string)
    end

    @doc """
    Returns true if the given value is a valid password (letters, numbers, underscores, hyphens, 6 < password_length < 18).

    ## Examples

        iex>  Mandrake.Validation.password("Examplepassword")
        true

    """
    def password(string) do
      Regex.match?(~r/^[a-zA-Z0-9_-]{6,18}$/, string)
    end

    @doc """
    Returns true if the given value is a valid hex.

    ## Examples

        iex>  Mandrake.Validation.hex("#C0C0C0")
        true

    """
    def hex(string) do
      Regex.match?(~r/^#?([a-f0-9]{6}|[a-f0-9]{3}|[A-F0-9]{6}|[A-F0-9]{3})$/, string)
    end

    @doc """
    Returns true if the given value is a valid slug.

    ## Examples

        iex>  Mandrake.Validation.slug("my-example-tytle")
        true

    """
    def slug(string) do
      Regex.match?(~r/^[a-z0-9-]+$/, string)
    end

    @doc """
    Returns true if the given value is a valid url.

    ## Examples

        iex>  Mandrake.Validation.url("http://example.org/")
        true

    """
    def url(string) do
      Regex.match?(~r/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, string)
    end

    @doc """
    Returns true if the given value is a valid ip address.

    ## Examples

        iex>  Mandrake.Validation.ip_address("127.0.0.1")
        true

    """
    def ip_address(string) do
      Regex.match?(~r/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/, string)
    end

    @doc """
    Returns true if the given value is a valid html tag.

    ## Examples

        iex>  Mandrake.Validation.html("<a href='https://example.org'>My example link</a>")
        true

    """
    def html(string) do
      Regex.match?(~r/^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$/, string)
    end

  end

  defmodule Type do

    @moduledoc """
    Mandrake functions for types.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Type
      end
    end

    @doc """
    Returns the extension of the tuple with the second.

    ## Examples

        iex>  Mandrake.Type.assign({ "prop1", "prop2" }, { "prop3" })
        { "prop1", "prop2", "prop3" }

    """
    def assign(first_tuple, second_tuple) do
      Elixir.List.to_tuple(Tuple.to_list(first_tuple) ++ Tuple.to_list(second_tuple))
    end

    @doc """
    Create a copy of a value.

    ## Examples

        iex>  Mandrake.Type.clone([1, 2, 3, 4, 5])
        [1, 2, 3, 4, 5]

    """
    def clone(object) do
      object
    end

    @doc """
    Always return true.

    ## Examples

        iex>  Mandrake.Type.bool_true()
        true

    """
    def bool_true() do
      true
    end

    @doc """
    Always return false.

    ## Examples

        iex>  Mandrake.Type.bool_false()
        false

    """
    def bool_false() do
      false
    end

    @doc """
    Returns true if value is nil.
    
    ## Examples

        iex>  Mandrake.Type.is_nil([])
        false
        iex>  Mandrake.Type.is_nil(nil)
        true

    """
    def is_nil(value) do
      value == nil
    end

    @doc """
    Returns true if value is nil.
    
    ## Examples

        iex>  Mandrake.Type.is(Integer, 5)
        true
        iex>  Mandrake.Type.is(List, 5)
        false

    """
    def is(type, value) do
      type == type_of(value)
    end

    @doc """
    Returns type of value.

    ## Examples

        iex>  Mandrake.Type.type_of(42.0)
        Float

    """
    def type_of(value) do
      cond do
        is_atom(value) ->
          Atom
        is_binary(value) ->
          Binary
        is_bitstring(value) ->
          Bitstring
        is_boolean(value) ->
          Boolean
        is_float(value) ->
          Float
        is_function(value) ->
          Function
        is_integer(value) ->
          Integer
        is_list(value) ->
          List
        is_map(value) ->
          Map
        is_number(value) ->
          Number
        is_pid(value) ->
          Pid
        is_port(value) ->
          Port
        is_reference(value) ->
          Reference
        is_tuple(value) ->
          Tuple
        Kernel.is_nil(value) ->
          Nil
      end
    end

    @doc """
    Removes whitespace at the beginning and at the end of the string.

    ## Examples

        iex>  Mandrake.Type.trim("   Example   ")
        "Example"

    """
    def trim(string) do
      String.strip(string)
    end

    @doc """
    Returns a function that split a string with the given pattern.

    ## Examples

        iex>  splitComma = Mandrake.Type.split(",")
        ...>  splitComma.("a,b,c")
        ["a", "b", "c"]

    """
    def split(pattern) do
      fn string -> String.split(string, pattern) end
    end

    @doc """
    Returns true if value is not nil.

    ## Examples

        iex>  Mandrake.Type.exists("Example")
        true
        iex>  Mandrake.Type.exists(nil)
        false

    """
    def exists(value) do
      !(value == nil)
    end

    @doc """
    Returns true if value is not nil or false.

    ## Examples

        iex>  Mandrake.Type.truthy("Example")
        true
        iex>  Mandrake.Type.truthy(nil)
        false

    """
    def truthy(value) do
      !(value == nil || value == false)
    end

    @doc """
    Returns true if value is nil or false.

    ## Examples

        iex>  Mandrake.Type.falsy("Example")
        false
        iex>  Mandrake.Type.falsy(nil)
        true

    """
    def falsy(value) do
      value == nil || value == false
    end

  end

  defmodule Annotation do

    @moduledoc """
    Mandrake annotations.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.Annotation
      end
    end

    @doc """
    Raise an exception if time for todo is over.

    ## Examples

        iex>  Mandrake.Annotation.todo({{2015, 12, 31}, {0, 0, 0}}, "Must implement 'sum' function")
        nil

    """
    def todo(date_time, description) do
      if Mandrake.DateTime.is_past(Mandrake.DateTime.get_local(), date_time) do
        raise Mandrake.TodoError.exception(date_time, description)
      end
    end

    @doc """
    Raise an exception if time to remove deprecation is over.

    ## Examples

        iex>  Mandrake.Annotation.deprecation({{2015, 12, 31}, {0, 0, 0}}, "Code refactoring needed")
        nil

    """
    def deprecation(date_time, description) do
      if Mandrake.DateTime.is_past(Mandrake.DateTime.get_local(), date_time) do
        raise Mandrake.DeprecationError.exception(date_time, description)
      end
    end

    @doc """
    Raise an exception if time to write documentation is over.

    ## Examples

        iex>  Mandrake.Annotation.documentation({{2015, 12, 31}, {0, 0, 0}}, "Write documentation for Math module")
        nil

    """
    def documentation(date_time, description) do
      if Mandrake.DateTime.is_past(Mandrake.DateTime.get_local(), date_time) do
        raise Mandrake.DocumentationNeededError.exception(date_time, description)
      end
    end

    @doc """
    Raise an exception if time to fix redundancy is over.

    ## Examples

        iex>  Mandrake.Annotation.redundancy({{2015, 12, 31}, {0, 0, 0}}, "Fix redundancy")
        nil

    """
    def redundancy(date_time, description) do
      if Mandrake.DateTime.is_past(Mandrake.DateTime.get_local(), date_time) do
        raise Mandrake.RedundancyError.exception(date_time, description)
      end
    end

    @doc """
    Raise an exception if time to fix an issue is over.

    ## Examples

        iex>  Mandrake.Annotation.fix({{2015, 12, 31}, {0, 0, 0}}, "Fix issue in 'sum' function")
        nil

    """
    def fix(date_time, description) do
      if Mandrake.DateTime.is_past(Mandrake.DateTime.get_local(), date_time) do
        raise Mandrake.FixNeededError.exception(date_time, description)
      end
    end

  end

  defmodule DateTime do

    @moduledoc """
    Mandrake functions for date and time.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.DateTime
      end
    end

    @doc """
    Format date or date_time with the given divider.

    ## Examples

        iex>  Mandrake.DateTime.format({{2015,12,31}, {10,30,15}}, "/")
        "2015/12/31 10:30:15"
        iex>  Mandrake.DateTime.format({2015,12,31}, "/")
        "2015/12/31"

    """
    def format({{year, month, day}, {hour, minute, second}}, divider) do
        format_date_time("~4..0B" <> divider <> "~2..0B" <> divider <> "~2..0B ~2..0B:~2..0B:~2..0B", [year, month, day, hour, minute, second])
    end

    def format({year, month, day}, divider) do
        format_date_time("~4..0B" <> divider <> "~2..0B" <> divider <> "~2..0B", [year, month, day])
    end

    @doc """
    Format time.

    ## Examples

        iex>  Mandrake.DateTime.format({10,30,15})
        "10:30:15"

    """
    def format({hour, minute, second}) do
        format_date_time("~2..0B:~2..0B:~2..0B", [hour, minute, second])
    end

    @doc """
    Format date to dd mm yyyy with the given divider.

    ## Examples

        iex>  Mandrake.DateTime.dd_mm_yyyy({2015,12,31}, "/")
        "31/12/2015"

    """
    def dd_mm_yyyy({year, month, day}, divider) do
        format_date_time("~2..0B" <> divider <> "~2..0B" <> divider <> "~4..0B", [day, month, year])
    end

    @doc """
    Format date to mm dd yyyy with the given divider.

    ## Examples

        iex>  Mandrake.DateTime.mm_dd_yyyy({2015,12,31}, "/")
        "12/31/2015"

    """
    def mm_dd_yyyy({year, month, day}, divider) do
        format_date_time("~2..0B" <> divider <> "~2..0B" <> divider <> "~4..0B", [month, day, year])
    end 

    @doc """
    Returns a function for date or time formatting.

    ## Examples

        iex>  formatWithSlash = Mandrake.DateTime.format_with_divider("/")
        ...>  formatWithSlash.({{2015,12,31}, {10,30,15}})
        "2015/12/31 10:30:15"

    """
    def format_with_divider(divider) do
      fn date_time -> format(date_time, divider) end
    end

    @doc """
    Format date/time with the given pattern and list using :io_lib.format.

    ## Examples

        iex>  Mandrake.DateTime.format_date_time("~2..0B:~2..0B:~2..0B", [10 ,30 ,15 ])
        "10:30:15"

    """
    def format_date_time(pattern, list) do
      :io_lib.format(pattern, list)
        |> Elixir.List.flatten
        |> to_string
    end

    @doc """
    Get current date and time.

    ## Examples

        iex>  Mandrake.DateTime.get()
        {{2015, 11, 29}, {15, 34, 18}}

    """
    def get() do
      :calendar.universal_time()
    end

    @doc """
    Get current local date and time.

    ## Examples

        iex>  Mandrake.DateTime.get_local()
        {{2015, 11, 29}, {15, 34, 18}}

    """
    def get_local() do
      :calendar.local_time()
    end

    @doc """
    Get current date.

    ## Examples

        iex>  Mandrake.DateTime.get_date()
        {2015, 11, 29}

    """
    def get_date() do
      extract_date(:calendar.universal_time())
    end

    @doc """
    Get current local date.

    ## Examples

        iex>  Mandrake.DateTime.get_local_date()
        {2015, 11, 29}

    """
    def get_local_date() do
      extract_date(:calendar.local_time())
    end

    @doc """
    Get current time.

    ## Examples

        iex>  Mandrake.DateTime.get_time()
        {15, 34, 18}

    """
    def get_time() do
      extract_time(:calendar.universal_time())
    end

    @doc """
    Get current local time.

    ## Examples

        iex>  Mandrake.DateTime.get_local_time()
        {15, 34, 18}

    """
    def get_local_time() do
      extract_time(:calendar.local_time())
    end

    @doc """
    Extract date to date_time.

    ## Examples

        iex>  Mandrake.DateTime.extract_date({{2015, 11, 29}, {15, 34, 18}})
        {2015, 11, 29}

    """
    def extract_date({date, time}) do
      date
    end

    @doc """
    Extract time to date_time.

    ## Examples

        iex>  Mandrake.DateTime.extract_time({{2015, 11, 29}, {15, 34, 18}})
        {15, 34, 18}

    """
    def extract_time({date, time}) do
      time
    end

    @doc """
    Returns the difference in seconds beetween two date_time elements (date_2 - date_1).

    ## Examples

        iex>  Mandrake.DateTime.offset({{2015, 11, 29}, {15, 34, 18}}, {{2015, 11, 30}, {15, 34, 18}})
        86400

    """
    def offset(date_1, date_2) do
      :calendar.datetime_to_gregorian_seconds(date_2) - :calendar.datetime_to_gregorian_seconds(date_1)
    end

    @doc """
    Returns days and time correspondig given seconds.

    ## Examples

        iex>  Mandrake.DateTime.seconds_to_date_time(86400)
        {1, {0, 0, 0}}

    """
    def seconds_to_date_time(seconds) do
      :calendar.seconds_to_daystime(Kernel.abs(seconds))
    end

    @doc """
    Returns true if first date_time is > than second.

    ## Examples

        iex>  Mandrake.DateTime.is_past({{2015, 11, 29}, {15, 34, 18}}, {{2015, 11, 28}, {15, 34, 18}})
        true

    """
    def is_past(date_1, date_2) do
      offset(date_1, date_2) < 0
    end

    @doc """
    Returns true if first date_time is < than second.

    ## Examples

        iex>  Mandrake.DateTime.is_future({{2015, 11, 29}, {15, 34, 18}}, {{2015, 11, 28}, {15, 34, 18}})
        false

    """
    def is_future(date_1, date_2) do
      offset(date_1, date_2) > 0
    end

    @doc """
    Add date to time.

    ## Examples

        iex>  Mandrake.DateTime.add_date({15, 34, 18})
        {{2015, 11, 29}, {15, 34, 18}}

    """
    def add_date(time) do
      {extract_date(get()), time}
    end

    @doc """
    Add time to date.

    ## Examples

        iex>  Mandrake.DateTime.add_time({2015, 11, 29})
        {{2015, 11, 29}, {0, 0, 0}}

    """
    def add_time(date) do
      {date, {0, 0, 0}}
    end



  end

  #Exceptions

  defmodule TodoError do
    @moduledoc """
    Error to notify that a TODO must be fixed.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.TodoError
      end
    end

    defexception [:message]

    @doc """
    Raise TodoError with the given date and message.

    ## Examples

        iex>  raise Mandrake.TodoError.exception({{2015, 12, 31}, {0, 0, 0}}, "Description")

    """
    def exception(date, message) do
      %TodoError{message: "\nTodo, time is over on #{inspect Mandrake.DateTime.format(date, "/")}.\nDescription: #{inspect message}"}
    end
  end

  defmodule DeprecationError do
    @moduledoc """
    Error to notify that a deprecation must be deleted.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.DeprecationError
      end
    end

    defexception [:message]

    @doc """
    Raise DeprecationError with the given date and message.

    ## Examples

        iex>  raise Mandrake.DeprecationError.exception({{2015, 12, 31}, {0, 0, 0}}, "Description")

    """
    def exception(date, message) do
      %DeprecationError{message: "\nFix deprecation, time is over on #{inspect Mandrake.DateTime.format(date, "/")}.\nDescription: #{inspect message}"}
    end
  end

  defmodule DocumentationNeededError do
    @moduledoc """
    Error to notify that documentation must be written.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.DocumentationNeededError
      end
    end

    defexception [:message]

    @doc """
    Raise DocumentationNeededError with the given date and message.

    ## Examples

        iex>  raise Mandrake.DocumentationNeededError.exception({{2015, 12, 31}, {0, 0, 0}}, "Description")

    """
    def exception(date, message) do
      %DocumentationNeededError{message: "\nWrite documentation, time is over on #{inspect Mandrake.DateTime.format(date, "/")}.\nDescription: #{inspect message}"}
    end
  end

  defmodule RedundancyError do
    @moduledoc """
    Error to notify that a redundancy must be fixed.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.RedundancyError
      end
    end

    defexception [:message]

    @doc """
    Raise RedundancyError with the given date and message.

    ## Examples

        iex>  raise Mandrake.RedundancyError.exception({{2015, 12, 31}, {0, 0, 0}}, "Description")

    """
    def exception(date, message) do
      %RedundancyError{message: "\nFix redundancy, time is over on #{inspect Mandrake.DateTime.format(date, "/")}.\nDescription: #{inspect message}"}
    end
  end

  defmodule FixNeededError do
    @moduledoc """
    Error to notify that a fix is needed.

    """

    defmacro __using__(_opts) do
      quote do
        import Mandrake.FixNeededError
      end
    end

    defexception [:message]

    @doc """
    Raise FixNeededError with the given date and message.

    ## Examples

        iex>  raise Mandrake.FixNeededError.exception({{2015, 12, 31}, {0, 0, 0}}, "Description")

    """
    def exception(date, message) do
      %FixNeededError{message: "\nFix issue, time is over on #{inspect Mandrake.DateTime.format(date, "/")}.\nDescription: #{inspect message}"}
    end
  end

end