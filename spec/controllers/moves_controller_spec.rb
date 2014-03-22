require 'spec_helper'

describe MovesController do
  it 'creates a move' do
    move = {
      super_power: 'England',
      turn: 1,
      request: 'A NOR -> SWE'
    }
    expect{ post :create, move: move }.to change{ Move.count }.by(1)
  end
end
