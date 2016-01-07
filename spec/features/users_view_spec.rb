require 'rails_helper'

RSpec.describe 'Users pages', type: :feature do
  include ViewHelper

  describe 'Viewing users pages' do
    let(:user) { FactoryGirl.create :user }

    context 'user logged out' do
      describe 'register page' do
        before do
          visit_page(new_user_path)
        end

        it 'shows register page' do
          expect(page).to have_content('Log in')
          expect(page).to have_content('Sign up')
        end
      end

      describe 'account page' do
        before do
          visit_page(account_path)
        end

        it 'redirect to register page' do
          expect(page).to have_content('Log in')
          expect(page).to have_content('Sign up')
          expect(page).to have_content('You cannot do this')
        end
      end
    end

    context 'user logged in' do
      before do
        login_as(user, scope: :user)
      end

      describe 'register page' do
        before do
          visit_page(new_user_path)
        end

        it 'redirects to root path' do
          expect(page).to have_content('Logix')
          expect(page).to have_content('Lorem ipsum')
        end
      end

      describe 'account page' do
        before do
          visit_page(account_path)
        end

        it 'shows account page' do
          expect(page).to have_content('Manage your account')
        end
      end
    end
  end
end
