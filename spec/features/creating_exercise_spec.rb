require 'rails_helper'

RSpec.feature 'Creating exercise' do
    before do
        @john = User.create(email: 'demo@example.com', password: 'password')
        login_as(@john)
    end

    scenario '- with valid inputs' do
        visit '/'

        click_link 'My Lounge'
        click_link 'New Exercise'
        expect(page).to have_link('Back')
        
        fill_in 'Duration', with: 70
        fill_in 'Workout Details', with: 'pushups'
        fill_in 'Activity date', with: '2020-10-10'
        click_button 'Create Exercise'

        expect(page).to have_content('Exercise has been created')
        
        @exercise = Exercise.last
        expect(current_path).to eq(user_exercise_path(@john, @exercise))
        expect(@exercise.user_id).to eq(@john.id)
    end
end