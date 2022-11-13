require_relative 'sudoku'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    sudoku = Sudoku.new(@puzzle_string)
    if sudoku.valid?
      return 'Sudoku is valid.' if sudoku.complete?

      'Sudoku is valid but incomplete.'
    else
      'Sudoku is invalid.'
    end
  end
end