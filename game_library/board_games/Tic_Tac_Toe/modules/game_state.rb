# GameState module Documentation comment
module GameState
  def winner?(object)
    board = object.board
    left_right_diagonals = [SquareArray.left_diagonal(board), SquareArray.right_diagonal(board)]
    x = ['X'] * object.grid_dimension
    o = ['O'] * object.grid_dimension
    status = nil
    (board + SquareArray.transpose(board) + left_right_diagonals).each do |line|
      status = line == x ? [true, 'X'] : line == o ? [true, 'O'] : [false, nil]
      break if status[0] == true
    end
    status
  end
end
