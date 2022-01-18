require 'rails_helper'

RSpec.describe "Add player names", type: :feature do
  
  scenario 'A user can add the names of one player in African cup of Nation sweepstake 1' do
    competition = Competition.create(name: "Africa Cup of Nations")
    visit "/competitions"
    click_link "Africa Cup of Nations"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Create Game"
    fill_in 'player_player1', with: 'John'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
  end

  scenario "a user can add 2 names for the african cup of nations" do
    competition = Competition.create(name: "Premier League")
    visit "/competitions"
    click_link "Premier League"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Create Game"
    fill_in 'player_player1', with: 'John'
    fill_in 'player_player2', with: 'Dave'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
    expect(page).to have_content('Dave')
  end
end

