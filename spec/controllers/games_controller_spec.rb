require 'spec_helper'

describe GamesController do
  let(:user) { create(:user) }

  context 'not logged in' do
    it 'requires you to sign in' do
      post :create
      expect(Game.count).to eq(0)
    end
  end

  context 'logged in' do
    before(:each) do
      session[:user_id] = user.id
    end
      
    describe 'GET new' do
      it 'instantiates a new game' do
        get :new
        expect(assigns(:game)).to be_a(Game)
      end
    end

    describe 'POST create' do
      it 'creates a game with the current user' do
        post :create
        expect(Game.count).to eq(1)
      end
    end

    describe 'GET show' do
      let(:game) { create(:game) }
      it 'retrieves the game' do
        get :show, id: game.id
        expect(assigns(:game)).to eq(game)
      end

      it 'retrieves the logged-in player' do
        session[:user_id] = user.id
        game.add_player(user)
        get :show, id: 1
        expect(assigns(:player)).to_not be_nil 
      end
    end

    describe 'GET join' do
      let(:game) { create(:game) }

      before(:each) do
        session[:user_id] = user.id
      end

      it 'adds the logged in user to the game' do
        get :join, id: game.id
        expect(game.users).to include(user)
      end

      it 'redirects to the current game display' do
        get :join, id: game.id
        expect(response).to redirect_to(game_path(game))
      end

      it 'adds a flash message to the request' do
        get :join, id: game.id
        expect(flash[:success]).to have_text(/You have joined the game as .+\./)
      end
    end
  end
end
