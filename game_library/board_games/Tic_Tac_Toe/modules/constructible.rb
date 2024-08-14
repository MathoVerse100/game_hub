# Constructible module Documentation comment
module Constructible
  SUBLINE_BLOCK = (' ' * 11).freeze
  X = "   \\\\  /   \n    \\\\/    \n    /\\\\    \n   /  \\\\   ".freeze
  O = "    ---    \n //     \\\\ \n \\\\     // \n    ---    ".freeze
  SYMBOL_ARRAYS = { 'X' => X.split("\n"), 'O' => O.split("\n") }.freeze

  def construct_board(grid_number)
    grid_number = grid_number.to_i
    board = []
    separator = "+----------#{'+-----------' * (grid_number - 2)}+----------+"

    grid_number.times do |row_nummber|
      index_subrow = [construct_block_indexer(row_nummber, grid_number).join('|')]
      nonindex_subrow = [([SUBLINE_BLOCK] * grid_number).join('|')] * 3
      row = (index_subrow + nonindex_subrow).join("\n")
      row_nummber == grid_number - 1 ? board.push(row) : board.push(row, separator)
    end
    board
  end

  def construct_block_indexer(row_nummber, grid_number)
    list = []
    (1..grid_number).each do |num|
      block_number = ((row_nummber * grid_number) + num).to_s

      list.push(block_number + SUBLINE_BLOCK[block_number.length..])
    end
    list
  end

  def construct_xo(board, _grid_dimension, row_number, column_number, symbol)
    board_row = board[row_number].split("\n").map { |line| line.split('|') }
    updated_row_lines = board_row.each_with_index { |line, index| line[column_number] = SYMBOL_ARRAYS[symbol][index] }

    updated_row_lines.map! do |subline|
      subline.join('|')
    end

    board[row_number] = updated_row_lines.join("\n")
    board
  end
end
