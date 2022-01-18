require 'rails_helper'

RSpec.feature "view player names and teams", type: :feature do

  scenario "user adds players and sees ordered team allocation" do
    competition = Competition.create(name: "Africa Cup of Nations")
    team = Team.create(name: "Algeria", competition_id: competition.id)
    team2 = Team.create(name: "Burkina Faso", competition_id: competition.id)
    visit "/competitions"
    click_link "Africa Cup of Nations"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Create Game"
    fill_in 'player_player1', with: 'John'  
    fill_in 'player_player2', with: 'Dave'  
    click_button 'Generate sweepstake'
    expect(page).to have_content("John")
    expect(page).to have_content("Algeria")
    expect(page).to have_content("Dave")
    expect(page).to have_content("Burkina Faso")
  end
end