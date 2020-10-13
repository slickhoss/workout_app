require 'rails_helper'

RSpec.feature "Listing Exercises" do
    before do
        @john = User.create(email: 'john@example.com', password: 'password')
        login_as(@john)
        @exercise1 = @john.exercises.create(duration_in_min: 20, workout: 'bench press', workout_date: 2.days.ago)
        
        @exercise2 = @john.exercises.create(duration_in_min: 20, workout: 'overhead press', workout_date: 2.days.ago)
        @exercise3 = @john.exercises.create(duration_in_min: 33, workout: 'overad press', workout_date: 8.days.ago)

    end

    scenario "show user's workout last 7 days" do
        visit '/'
        click_link 'My Lounge'

        expect(page).to have_content(@exercise1.duration_in_min)
        expect(page).to have_content(@exercise1.workout)
        expect(page).to have_content(@exercise1.workout_date)

        expect(page).to have_content(@exercise2.duration_in_min)
        expect(page).to have_content(@exercise2.workout)
        expect(page).to have_content(@exercise2.workout_date)
        
        expect(page).not_to have_content(@exercise3.duration_in_min)
        expect(page).not_to have_content(@exercise3.workout)
        expect(page).not_to have_content(@exercise3.workout_date)
    end
end