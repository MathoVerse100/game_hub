require_relative 'board_games/board_game'

# Games module Documentation comment
module Games
  def self.get_games
    games = []
    module_name = nil

    game_modules.each do |line|
      if line.match(/^(module)/)
        module_name = line.strip.split.last
      elsif line.include?('class')
        games.push("#{module_name}::#{line.strip.split[1]}")
      end
    end

    games
  end

  def self.game_modules
    content = []

    directories = Dir.glob("#{__dir__}/*").select { |entity| File.directory?(entity) }
    directories.each do |directory|
      Dir.glob("#{directory}/*").each do |file|
        content.push(File.read(file)) if File.basename(file) == "#{File.basename(directory)[...-1]}.rb"
      end
    end

    content.join("\n").split("\n")
  end
end
