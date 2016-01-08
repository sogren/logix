require 'rails_helper'

RSpec.describe 'Users register', type: :feature do
  include ViewHelper
  include RegistrationsHelper

  let(:user) { FactoryGirl.create :user }

  describe 'Creating new user' do
    context 'with #valid params' do
      before do
        register_user('qwer','email12@example.com')
      end

      it 'registers successfully page' do
        expect(page).to have_content('Welcome! You have signed up successfully')
      end
      it 'shows account page' do
        expect(page).to have_content('Manage your account')
      end
      it 'is creating user' do
        expect(User.count).to eql(1)
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
      it 'is not creating user' do
        expect(User.count).to eql(0)
      end
      it 'informs about error' do
        expect(page).to have_content('Please review the problems')
      end
    end
  end

  describe 'Signing in' do
    context 'with #valid params' do
      before do
        login_user(user.email)
      end

      it 'successfully logs in user' do
        expect(page).to have_content('Signed in successfully')
      end
      it 'shows account page' do
        expect(page).to have_content('Manage your account')
      end
    end

    context 'with #invalid params' do
      before do
        login_user("#{user.email}13f")
      end

      it 'displays warning flash' do
        expect(page).to have_content('Invalid email or password')
      end
      it 'stays on log in page' do
        expect(page).to have_content('Log in')
      end
    end
  end
end
