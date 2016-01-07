require 'rails_helper'

RSpec.describe 'Users register', type: :feature do
  include ViewHelper
  include RegistrationsHelper

  describe 'Creating new user' do
    let(:user) { FactoryGirl.create :user }

    context 'with #valid params' do
      before do
        register_user('qwer','email12@example.com')
      end

      it 'registers successfully page' do
        expect(page).to have_content('Welcome! You have signed up successfully')
      end
      it 'show account page' do
        expect(page).to have_content('Manage your account')
      end
    end

    context 'with #invalid params' do
      before do
        register_user('','')
      end

      it 'redirect to register page' do
        expect(page).to have_content('Log in')
        expect(page).to have_content('Sign up')
        expect(page).to have_content('Sign up')
      end
    end
  end
end
