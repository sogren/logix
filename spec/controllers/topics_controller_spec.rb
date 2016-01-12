require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:user2) { FactoryGirl.create :user }
  let(:topic) { FactoryGirl.create :valid_topic, author: user2 }

  context 'user #logged_in' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      before do
        get :index
      end
      it 'exposes topics' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: topic.id
      end
      it 'exposes topic' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'exposes topic' do
        expect(response).to render_template(:new)
      end
    end

    describe 'POST #create' do
      before do
        post :create, topic: { title: 'abcd', content: 'awefawe' }
      end
      it 'exposes topic' do
        expect(response).to redirect_to("/topics/#{topic.id - 1}")
      end
    end
  end

  context 'user #logged_out' do
    describe 'GET #index' do
      before do
        get :index
      end
      it 'exposes topics' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: topic.id
      end
      it 'exposes topic' do
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'redirects user' do
        expect(response).to redirect_to(topics_path)
      end
    end

    describe 'POST #create' do
      before do
        post :create, topic: { title: 'abcd', content: 'awefawe' }
      end
      it 'redirects user' do
        expect(response).to redirect_to(topics_path)
      end
    end
  end
end
