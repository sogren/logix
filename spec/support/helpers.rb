# Helper for viewing path with capybara
module ViewHelper
  def visit_page(path)
    visit path
  end
end

# Helper for registering with capybara
module RegistrationsHelper
  def register_user(username, email)
    visit new_user_registration_path
    within('#sign-up-form') do
      fill_form('user', username: username, email: email)
      click_button 'Sign up'
    end
  end

  def login_user(email)
    visit new_user_session_path
    within('#new_user') do
      fill_form('user', email: email)
      click_button 'Log in'
    end
  end

  def fill_form(kind, hash)
    hash.each do |key, value|
      fill_in "#{kind}_#{key}", with: value
    end
    fill_passwords
  end

  def fill_passwords(password = 'qwerqwer')
    up = 'user_password'
    upc = 'user_password_confirmation'
    ucp = 'user_current_password'
    [up, upc, ucp].each do |pass|
      fill_in pass, with: password if page.has_field?(pass)
    end
  end
end

# Helper for creating topics with capybara
module TopicCreationHelper
end
