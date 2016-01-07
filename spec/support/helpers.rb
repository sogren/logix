module ViewHelper
  def visit_page(path)
    visit path
  end
end

module RegistrationsHelper
  def register_user
    visit new_user_path
    fill_in 'user_name', :with => 'user.username'
    fill_in 'password', :with => 'saf'
    click_button 'sign_up_button'
  end
end

module TopicCreationHelper
  def regi2ster_user(user)
    visit root_path
    fill_in 'user_name', :with => user.email
    fill_in 'password', :with => user.password
    click_button 'sign_up_button'
  end

  def log_in(user)
    visit home_page
    fill_in 'user_name', :with => user.email
    fill_in 'password', :with => user.password
    click_button 'sign_up_button'
  end
end

module PlayHelper
  def regist3er_user(user)
    visit home_page
    fill_in 'user_name', :with => user.username
    fill_in 'password', :with => user.password
    click_button 'sign_up_button'
  end
end