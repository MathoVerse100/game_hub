## The SquareArray module contains utility methods for operations on square arrays.
#
# This module includes:
# - right_diagonal(array): Returns the right diagonal of the given square array.
# - left_diagonal(array): Returns the left diagonal of the given square array.
# - transpose(array): Transposes the given square array.
# - index_to_row_column(value, dimension): Converts a linear index to row and column coordinates in a square array.
module SquareArray
  def self.right_diagonal(array)
    diagonal = []
    array.length.times do |i|
      diagonal.push(array[array.length - 1 - i][i])
    end
    diagonal
  end

  def self.left_diagonal(array)
    diagonal = []
    array.length.times do |i|
      diagonal.push(array[i][i])
    end
    diagonal
  end

  def self.transpose(array)
    transposed_array = Array.new(array.length) { Array.new(array.length) }
    array.length.times do |row|
      array.length.times do |column|
        transposed_array[row][column] = array[column][row]
      end
    end
    transposed_array
  end

  def self.index_to_row_column(value, dimension)
    [value / dimension, value % dimension]
  end
end
