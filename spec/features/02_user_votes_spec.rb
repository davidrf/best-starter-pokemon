require "spec_helper"

feature "user votes" do
  scenario "user can navigate to voting form from the vote counts" do
    visit "/vote_counts"
    click_link "Go Vote"

    expect(page).to have_current_path("/vote_counts/new")
    expect(page).to have_field("Bulbasaur")
    expect(page).to have_field("Squirtle")
    expect(page).to have_field("Charmander")
    expect(page).to have_button("Vote!")
  end

  scenario "user submits a vote" do
    visit "/vote_counts/new"
    choose "Bulbasaur"
    click_on "Vote!"

    expect(page).to have_current_path("/vote_counts")
    expect(page).to have_content("Bulbasaur: 1")
  end

  scenario "user submits form without voting" do
    visit "/vote_counts/new"
    click_on "Vote!"

    expect(page).to have_css("form")
  end
end
