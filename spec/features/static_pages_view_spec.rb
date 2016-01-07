require 'rails_helper'

RSpec.describe 'StaticPages view', type: :feature do
  include ViewHelper

  let(:user) { FactoryGirl.create :user }

  context 'user #logged_out' do
    describe 'Logix page' do
      it 'show logix page' do
        visit_page(root_path)
        expect(page).to have_content('Logix')
        expect(page).to have_content('Lorem ipsum')
      end
    end

    describe 'play page' do
      it 'redirects to register page' do
        visit_page(play_path)
        expect(page).to have_css('div#game-wrapper')
      end
    end

    describe 'about page' do
      it 'redirects to register page' do
        visit_page(about_path)
        expect(page).to have_content('Logix is a logic game')
        expect(page).to have_content('Lorem ipsum')
      end
    end
  end

  context 'user #logged_in' do
    before do
      login_as(user, scope: :user)
    end

    describe 'Logix page' do
      it 'show logix page' do
        visit_page(root_path)
        expect(page).to have_content('Logix')
        expect(page).to have_content('Lorem ipsum')
      end
    end

    describe 'play page' do
      it 'redirects to register page' do
        visit_page(play_path)
        expect(page).to have_css('div#game-wrapper')
      end
    end

    describe 'about page' do
      it 'redirects to register page' do
        visit_page(about_path)
        expect(page).to have_content('Logix is a logic game')
        expect(page).to have_content('Lorem ipsum')
      end
    end
  end
end
