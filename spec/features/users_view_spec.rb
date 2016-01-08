require 'rails_helper'

RSpec.describe 'Users view', type: :feature do
  include ViewHelper

  describe 'Viewing users pages' do
    let(:user) { FactoryGirl.create :user }

    context 'user #logged_out' do
      describe 'login page' do
        it 'shows login page' do
          visit_page(new_user_session_path)
          expect(page).to have_content('Log in')
          expect(page).to have_content('Forgot your password?')
        end
      end

      describe 'register page' do
        it 'shows register page' do
          visit_page(new_user_registration_path)
          expect(page).to have_content('Sign up')
          expect(page).to have_content("It's free!")
        end
      end

      describe 'account page' do
        it 'redirect -> register page' do
          visit_page(account_path)
          expect(page).to have_content('Logix')
          expect(page).to have_content('You cannot do this')
        end
      end

      describe 'index page' do
        it 'shows index page' do
          visit_page(users_path)
          expect(page).to have_content('Top users:')
        end
      end

      describe 'show page' do
        it 'shows show page' do
          visit_page(user_path(user))
          expect(page).to have_content('Profile of user:')
          expect(page).to have_content("#{user.username}")
        end
      end
    end

    context 'user #logged_in' do
      before do
        login_as(user, scope: :user)
      end

      describe 'register page' do
        it 'redirects to account page' do
          visit_page(new_user_registration_path)
          expect(page).to have_content('You are already signed in')
          expect(page).to have_content('Manage your account')
        end
      end

      describe 'login page' do
        it 'redirects to account page' do
          visit_page(new_user_session_path)
          expect(page).to have_content('You are already signed in')
          expect(page).to have_content('Manage your account')
        end
      end

      describe 'account page' do
        it 'shows account page' do
          visit_page(account_path)
          expect(page).to have_content('Manage your account')
        end
      end

      describe 'index page' do
        it 'shows index page' do
          visit_page(users_path)
          expect(page).to have_content('Top users:')
        end
      end

      describe 'show page' do
        it 'shows show page' do
          visit_page(user_path(user))
          expect(page).to have_content('Profile of user:')
          expect(page).to have_content("#{user.username}")
        end
      end
    end
  end
end
