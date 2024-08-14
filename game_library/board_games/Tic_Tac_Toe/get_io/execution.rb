# TicTacToe_ module Documentation comment
module TicTacToe_
  # Execution module Documentation comment
  module Execution
    def self.run(board)
      last_turn_player = nil

      (board.grid_dimension**2).times do |i|
        round(board, i)

        if board.status[0]
          last_turn_player = i % 2 == 0 ? board.player_x : board.player_o
          break
        end
      end
      get_result(board, last_turn_player)
    end

    def self.round(board, round_number)
      player_turn = round_number.even? ? board.player_x : board.player_o
      row, column = get_player_position(board, player_turn)
      board.insert(row, column, { 0 => 'X', 1 => 'O' }[round_number % 2])
      nil
    end

    def self.get_player_position(board, player_turn)
      puts "\n#{board}"
      loop do
        print "#{player_turn}'s turn: "
        player_position = ExceptionHandler.player_position(BoardGame::TicTacToe, board, gets.chomp)
        return player_position if player_position

        puts 'Please choose an available position. Try again.'
      end
    end

    def self.get_result(board, player_turn)
      if board.status[0]
        puts "#{board}\n\nGAME!!! #{player_turn} wins!"
      else
        puts "#{board}\n\nGAME!!! It's a draw!"
      end
      nil
    end
  end
end
