# TicTacToe_ module Documentation comment
module TicTacToe_
  # ValidateExecution module Documentation comment
  module ValidateExecution
    def self.player_position(board, input)
      return false if input.nil? || input.strip.empty?

      input.strip!
      return false unless input.match(/^\d+$/)
      return false if input.to_i < 1 || input.to_i > board.grid_dimension**2

      row, column = SquareArray.index_to_row_column(input.to_i - 1, board.grid_dimension)
      return false unless board.empty?(row, column)

      [row, column]
    end
  end
end
