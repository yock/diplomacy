require 'spec_helper'

describe Game do
  it { should have_many(:users).through(:players) }
  it { should belong_to :creator }
  it { should validate_presence_of :creator }

  let(:user) { create(:user) }
  let(:game) { create(:game) }

  describe 'adding a player to a game' do
    it 'adds them to users' do
      game.add_player user
      
      expect(game.users).to include user
      expect(game.players.count).to eq(1)
    end

    it 'rendomly assigns the new player to a super power' do
      new_player = game.add_player user
      expect(new_player.super_power).to_not be_nil
    end
  end

  describe '#player_from_user' do
    it 'retrieves the player based on the passed user' do
      game.add_player(user)
      player = game.player_from_user(user)
      expect(player.user).to eq(user)
    end
  end
end
