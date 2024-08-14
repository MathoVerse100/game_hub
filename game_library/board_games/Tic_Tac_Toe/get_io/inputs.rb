# TicTacToe_ module Documentation comment
module TicTacToe_
  # Inputs module Documentation comment
  module Inputs
    def self.get_parameters
      player_x = get_player_name('X')
      player_o = get_player_name('O')
      grid_dimension = get_grid_dimension

      [player_x, player_o, grid_dimension]
    end

    def self.get_player_name(symbol)
      loop do
        print "Player #{symbol}'s Name: "
        player_name = ExceptionHandler.player_name(BoardGame::TicTacToe, gets.chomp)
        return player_name if player_name

        puts "--> Player name should include at least one alphabet and no special characters. Please try again.\n"
      end
    end

    def self.get_grid_dimension
      loop do
        print 'Grid Size? '
        grid_dimension = ExceptionHandler.grid_dimension(BoardGame::TicTacToe, gets.chomp)
        return grid_dimension if grid_dimension

        puts "--> Grid dimension must be an integer greater than 2 and less than 6. Please try again.\n"
      end
    end
  end
end
