class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  validates :super_power, inclusion: {in: Game::SUPER_POWERS}
end
