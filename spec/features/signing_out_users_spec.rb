require 'rails_helper'

RSpec.feature 'Signing out users' do
    before do
        @john = User.create(email: 'demo@example.com', password: 'password')
        visit '/'
        click_link 'Sign In'
        fill_in 'Email', with: @john.email
        fill_in 'Password', with: @john.password
        click_button 'Log in'        
    end

    scenario '- sign out logged in user' do
        click_link 'Sign out'
        expect(page).to have_content('Signed out successfully.')
    end
end