require 'rails_helper'

RSpec.feature 'Siging users in' do
    before do
        @john = User.create(email: 'demo@example.com', password: 'password')
    end

    scenario '- sign in with valid credentials' do
        visit '/'
        click_link 'Sign In'
        fill_in 'Email', with: @john.email
        fill_in 'Password', with: @john.password
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully.')
        expect(page).not_to have_link('Sign Up')
        expect(page).not_to have_link('Sign In')
    end

    scenario '- sign in with invalid credentials' do
        visit '/'
        click_link 'Sign In'
        fill_in 'Email', with: 'demo2@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_link('Sign Up')
        expect(page).to have_link('Sign In')
        expect(page).not_to have_link('Sign Out')
    end
end