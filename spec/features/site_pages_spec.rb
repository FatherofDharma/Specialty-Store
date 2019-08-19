require 'rails_helper'

describe "visit the landing page" do
  it "visits the landing page" do
    visit root_path
    expect(page).to have_content "Welcome to Mario's Specialty Knives!"
  end
end
