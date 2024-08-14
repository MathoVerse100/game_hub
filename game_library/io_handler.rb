require_relative './board_games/exception_handler'
require_relative './board_games/Tic_Tac_Toe/get_io/inputs'
require_relative './board_games/Tic_Tac_Toe/get_io/execution'

# IOHandler module Documentation stuff
module IOHandler
  def self.get_parameters(game)
    inputs_module = Object.const_get("#{game.to_s.split('::').last}_::Inputs")
    inputs_module.get_parameters
  end

  def self.execute(object)
    execution_module = Object.const_get("#{object.class.to_s.split('::').last}_::Execution")
    execution_module.run(object)
  end
end
