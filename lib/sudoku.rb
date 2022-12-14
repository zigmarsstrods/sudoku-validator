class Sudoku
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def complete?
    !matrix.flatten
           .include?('0')
  end

  def valid?
    [matrix, transposed_matrix, subgroup_matrix].map(&method(:valid_version?)).all?(true)
  end

  private

  def matrix
    @puzzle_string.scan(/\w+/)
                  .each_slice(9)
                  .to_a
  end

  def transposed_matrix
    matrix.transpose
  end

  def subgroup_matrix
    matrix.map { |row| row.each_slice(3) }
          .each_slice(3)
          .map { |(first_row, second_row, third_row)| first_row.zip(second_row, third_row) }
          .flatten(1)
          .map(&:flatten)
  end

  def valid_version?(matrix)
    matrix.each do |row|
      return false unless row_valid?(row)
    end
    true
  end

  def row_valid?(row)
    row.each do |element|
      next if element == '0'
      return false if !element.to_i.between?(1, 9) || row.count(element) != 1
    end
    true
  end
end