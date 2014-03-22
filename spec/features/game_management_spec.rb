require 'spec_helper'

feature 'Game management' do
  before(:each) do
    sign_in
  end

  scenario 'start a new game' do
    visit '/games/new'
    click_button 'Start a new game'

    expect(page).to have_text('Use this URL to invite players to join')
    expect(page).to have_text('games/1/join')
  end
  scenario 'join a game' do
    game = create(:game)
    visit "/games/#{game.id}/join"
    
    expect(page).to have_text(/You have joined the game as .+\./)
  end
  scenario 'advance the current turn' do
    game = create(:game)
    visit "/games/#{game.id}"
    click_button 'Finish this round'

    expect(page).to have_text('Fall 1901')
  end
  scenario 'declare a winner'
end

def sign_in(user = create(:user))
  @user = user
  visit 'auth/developer'
  fill_in 'Name', with: 'Developer'
  fill_in 'Email', with: 'email@example.com'
  click_button 'Sign In'
end
