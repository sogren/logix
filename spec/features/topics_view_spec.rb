require 'rails_helper'

RSpec.describe 'Topics pages', type: :feature do
  include ViewHelper

  describe 'Viewing topics pages' do
    let(:user) { FactoryGirl.create :user }
    let(:topic) { FactoryGirl.create :valid_topic, author: user }

    context 'user logged out' do
      describe 'forum page' do
        before do
          visit_page(topics_path)
        end

        it 'shows forum page' do
          expect(page).to have_content('Latest topics')
        end
        it 'has topics details page' do
          expect(page).to have_content('Title')
          expect(page).to have_content('Activity')
          expect(page).to have_content('Posts')
          expect(page).to have_content('Views')
        end
      end

      describe 'new topic page' do
        before do
          visit_page(new_topic_path)
        end

        it 'redirects to forum page' do
          expect(page).to have_content('Latest topic')
          expect(page).to have_content('You cannot do this! First sign in')
        end
      end

      describe 'show topic page' do
        before do
          visit_page(topic_path(topic))
        end

        it 'shows topic page' do
          expect(page).to have_content('Custom topic')
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
        end
        it 'has topics details page' do
          expect(page).to have_content('Title')
          expect(page).to have_content('Activity')
          expect(page).to have_content('Posts')
          expect(page).to have_content('Views')
        end
      end

      describe 'new topic page' do
        before do
          visit_page(new_topic_path)
        end

        it 'shows new topic page' do
          expect(page).to have_content('Create new topic')
        end
      end

      describe 'show topic page' do
        before do
          visit_page(topic_path(topic))
        end

        it 'shows topic page' do
          expect(page).to have_content('Custom topic')
        end
      end
    end
  end
end
