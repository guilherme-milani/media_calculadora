defmodule Student do
  defstruct name: nil, results: []

  def first_name(student) do
    student.name
    |> String.split()
    |> List.first()
  end

  def last_name(student) do
    student.name
    |> String.split()
    |> List.last()
  end
end
