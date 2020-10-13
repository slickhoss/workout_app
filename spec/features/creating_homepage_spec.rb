require 'rails_helper'

RSpec.feature 'Creating home page test' do
    scenario '- home page test' do
        expect(page).to have_link('Home')
        expect(page).to have_link('Athletes Den')
        expect(page).to have_content('Workout Lounge!')
        expect(page).to have_content('Show off your workout')
    end

end