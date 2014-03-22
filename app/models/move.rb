class Move < ActiveRecord::Base
  validates :request, :turn, presence: true
  belongs_to :player
end
