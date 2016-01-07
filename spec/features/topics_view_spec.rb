require 'rails_helper'

RSpec.describe 'Topics pages', type: :feature do
  include ViewHelper

  describe 'Viewing topics pages' do
    let(:user) { FactoryGirl.create :user }

    context 'user logged out' do
      describe 'forum page' do
        before do
          visit_page(topics_path)
        end

        it 'shows forum page' do
          expect(page).to have_content('Latest topics')
          expect(page).to have_content('Sign up')
        end
      end

      describe 'new topic page' do
        before do
          visit_page(new_topic_path)
        end

        it 'redirects to forum page' do
          expect(page).to have_content('Latest topic')
          expect(page).to have_content('You cannot go there! First sign in')
        end
      end
    end

    context 'user logged in' do
      before do
        login_as(user, scope: :user)
      end

      describe 'forum page' do
        before do
          visit_page(topics_path)
        end

        it 'shows forum page' do
          expect(page).to have_content('Latest topics')
          expect(page).to have_content('Sign up')
        end
      end

      describe 'new topic page' do
        before do
          visit_page(new_topic_path)
        end

        it 'shows new topic page' do
          expect(page).to have_content('create topic')
        end
      end
    end
  end
end
