require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }

  context 'user logged in' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      before do
        get :index
      end
      it 'exposes users' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: user2.id
      end
      it 'exposes user profile' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'redirect to root patht' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'user logged out' do
    before do
      get :index
    end

    describe 'GET #index' do
      before do
        get :index
      end
      it 'exposes users' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: user2.id
      end
      it 'exposes user profile' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'redirects user' do
        expect(response).to render_template(:new)
      end
    end
  end
end
