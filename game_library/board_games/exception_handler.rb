require_relative './Tic_Tac_Toe/validate_io/inputs'
require_relative './Tic_Tac_Toe/validate_io/execution'

# ExceptionHandler module Documentation Stuff
module ExceptionHandler
  def self.player_name(game, name)
    validate_inputs_module = Object.const_get("#{game.to_s.split('::').last}_::ValidateInput")
    validate_inputs_module.player_name(name)
  end

  def self.grid_dimension(game, dimension)
    validate_inputs_module = Object.const_get("#{game.to_s.split('::').last}_::ValidateInput")
    validate_inputs_module.grid_dimension(dimension)
  end

  def self.player_position(game, board, position)
    validate_execution_module = Object.const_get("#{game.to_s.split('::').last}_::ValidateExecution")
    validate_execution_module.player_position(board, position)
  end
end
