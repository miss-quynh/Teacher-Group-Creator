require "rails_helper"

feature "User management" do
  let(:teacher) { Teacher.create(first_name: 'Broccoli', last_name: 'Green', email: 'vegetable@gmail.com', password: 'healthy') }

  scenario "user log in" do
    visit root_path
    fill_in 'Email', with: teacher.email
    fill_in 'Password', with: teacher.password
    click_button 'Sign In'

    expect(page).to have_content("Successfully logged in.")

    within ".home-page" do
      expect(page).to have_content "Students"
      expect(page).to have_content "Teachers"
    end
  end

  scenario "user log out" do
    visit root_path
    fill_in 'Email', with: teacher.email
    fill_in 'Password', with: teacher.password
    click_button 'Sign In'
    click_link 'Sign Out'

    expect(page).to have_content("Successfully logged out.")
  end

end