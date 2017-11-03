require "rails_helper"

feature "Visiting the homepage" do
  let(:teacher) { Teacher.create(first_name: 'Broccoli', last_name: 'Green', email: 'vegetable@gmail.com', password: 'healthy') }

  scenario "after logging in" do
    visit root_path
    fill_in 'Email', with: teacher.email
    fill_in 'Password', with: teacher.password
    click_button 'Sign In'

    click_link 'Teachers'
    expect(page).to have_current_path("/teachers")

    visit root_path

    click_link 'Students'
    expect(page).to have_current_path("/students")
  end

end