require "spec_helper"

feature "user sees vote counts" do
  scenario "user views vote counts for each pokemon" do
    CSV.open("votes.csv", "a", headers: true) do |file|
      file.puts(["bulbasaur"])
      file.puts(["squirtle"])
      file.puts(["squirtle"])
    end

    visit "/vote_counts"
    expect(page).to have_content("Bulbasaur: 1")
    expect(page).to have_content("Squirtle: 2")
    expect(page).to have_content("Charmander: 0")
  end
end
