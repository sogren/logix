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
      fill_in 'user_username', with: username
      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'qwerqwer'
      fill_in 'user_password_confirmation', with: 'qwerqwer'
      click_button 'Sign up'
    end
  end

  def login_user(email)
    visit new_user_session_path
    within('#new_user') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: 'qwerqwer'
      click_button 'Log in'
    end
  end
end

# Helper for creating topics with capybara
module TopicCreationHelper
  def regi2ster_user(user)
    visit root_path
    fill_in 'user_name', with: user.email
    fill_in 'password', with: user.password
    click_button 'sign_up_button'
  end

  def log_in(user)
    visit home_page
    fill_in 'user_name', with: user.email
    fill_in 'password', with: user.password
    click_button 'sign_up_button'
  end
end
