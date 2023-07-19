defmodule Calculator do
  def start() do
    guilherme = %Student{name: "Guilherme Milani", results: build_subjects([9.9, 3.9, 6.9, 9.5])}
    beto = %Student{name: "Beto Machado", results: build_subjects([9.9, 3.7, 5.8, 8.9])}
    ari = %Student{name: "Ari Milani", results: build_subjects([9.6, 3.9, 6.1, 9.0])}
    paulo = %Student{name: "Paulo Silva", results: build_subjects([9.6, 3.7, 5.8, 8.6])}

    result = calculate([guilherme, beto, ari, paulo])
    best = best_result(result)

    {result, best}
  end

  defp best_result(students) do
    max_result =
      students
      |> Enum.map(& &1.average)
      |> Enum.max()

    students
    |> Enum.filter(& &1.average == max_result)
  end

  defp calculate(students) do

    students
    |> Enum.map(
      &%{
        average: average(&1),
        first_name: Student.first_name(&1),
        last_name: Student.last_name(&1)
      }
    )
  end

  defp average(student) do
  number_of_subjects = Enum.count(student.results)

  sum_of_grades =

    student.results
    |> Enum.map(& &1.result) #[9.8, 3.9, 9.8, 9.8]
    |> Enum.reduce(& &1 + &2)

  Float.ceil(sum_of_grades / number_of_subjects, 2)
  end

  defp build_subjects(grades_list) do

    subjects = ["Matemática", "Português", "Geografia", "História"]

    subjects
    |> Enum.map(&(%Subject{name: &1, result: Enum.random(grades_list)}))
  end
end
