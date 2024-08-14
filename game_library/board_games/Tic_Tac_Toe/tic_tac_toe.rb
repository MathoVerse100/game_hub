require_relative 'modules/constructible'
require_relative 'modules/game_state'

# TicTacToe class Documentation comment
class TicTacToe
  include Constructible
  include GameState
  private :construct_board, :construct_block_indexer, :construct_xo, :winner?

  attr_reader :grid_dimension, :player_x, :player_o, :board, :transpose

  def initialize(player_x, player_o, grid_dimension)
    @player_x = player_x
    @player_o = player_o
    @grid_dimension = grid_dimension
    @board = Array.new(grid_dimension) { Array.new(grid_dimension) }
    @visual_board = construct_board(grid_dimension)
  end

  def to_s
    "\n#{@player_x} .VS. #{@player_o}\n#{@visual_board.join("\n")}\n"
  end

  def insert(row_number, column_number, symbol)
    @board[row_number][column_number] = symbol.upcase
    @visual_board = construct_xo(@visual_board, @grid_dimension, row_number * 2, column_number, symbol.upcase)
    nil
  end

  def empty?(row_number, column_number)
    return true if @board[row_number][column_number].nil?

    false
  end

  def status
    winner?(self)
  end
end
