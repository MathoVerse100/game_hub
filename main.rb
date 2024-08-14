require_relative 'utils/array_methods'
require_relative 'game_library/games'
require_relative 'game_library/io_handler'
require_relative 'game_library/board_games/board_game'

def main
  game_classes, game_names = load_games
end

def load_games
  game_options = Games.get_games
  game_classes = game_options.map { |game| Object.const_get(game) }
  game_names = game_options.map { |game| game.split('::').last }

  [game_classes, game_names]
end

def play(game)
  parameters = IOHandler.get_parameters(game)
  board = game.new(*parameters)
  IOHandler.execute(board)
end

begin
  play(BoardGame::TicTacToe)
rescue Interrupt
  puts "\n\nSee your later."
  exit
end
