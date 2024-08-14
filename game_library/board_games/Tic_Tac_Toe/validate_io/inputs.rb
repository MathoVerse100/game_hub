# TicTacToe_ module Documentation comment
module TicTacToe_
  # ValidateInput module Documentation comment
  module ValidateInput
    def self.player_name(input)
      return false if input.nil? || input.strip.empty?

      input.strip!
      return false if input.length < 2 || input.length > 20
      return false unless input.match(/^[A-Za-z]/)
      return false if input.match(/([^\w])|(_{2,})/)

      input
    end

    def self.grid_dimension(input)
      return false if input.nil? || input.strip.empty?

      input.strip!
      return false unless input.match(/^\d+$/)
      return false if input.to_i < 3 || input.to_i > 5

      input.to_i
    end
  end
end
