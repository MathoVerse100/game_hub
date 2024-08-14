require_relative 'utils/array_methods'
require_relative 'game_library/games'
require_relative 'game_library/io_handler'
require_relative 'game_library/board_games/board_game'

def main
  game_classes, game_names = load_games
  user_choice = loop do
    puts "Choose a game from the available ones below (type the associated number of the game)\n\n"
    game_names.each_with_index do |game, index|
      puts "(#{index + 1}) #{game}\n"
    end
    print "\n---> "
    input = gets.chomp.strip
    return input.to_i if input.match(/^\d+$/) && 1 <= input.to_i && input.to_i <= game_names.length
  end
  
  play(game_classes[user_choice - 1])
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
  main
rescue Interrupt
  puts "\n\nSee your later."
  exit
end
