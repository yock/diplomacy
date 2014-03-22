class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  validates :creator, presence: true

  SUPER_POWERS = [
      'Austria',
      'England',
      'France',
      'Germany',
      'Italy',
      'Russia',
      'Turkey'
  ].freeze

  def add_player(user)
    already_assigned = players.collect { |p| p.super_power }
    assignment = (SUPER_POWERS - already_assigned).sample
    Player.create(game: self, user: user, super_power: assignment)
  end

  def player_from_user(user)
    players.where(user_id: user.id).first
  end

end
