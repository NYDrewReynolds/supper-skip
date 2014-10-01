require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'admin user', type: :feature do
	before do
		user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
		Membership.create(user_id: 1, role: "admin")

    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
	end

	it 'has a role of admin' do
		visit '/'
		expect(page).to have_content("administrator")
	end
end
