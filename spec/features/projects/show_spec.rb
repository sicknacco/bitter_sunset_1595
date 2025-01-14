require 'rails_helper'

RSpec.describe "Project Show Page", type: :feature do
  before(:each) do
    @challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @project = @challenge.projects.create!(name: "News Chic", material: "Newspaper")
    
    @contestant_1 = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @contestant_2 = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @contestant_3 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @contestant_4 = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    @contestant_1.projects << @project
    @contestant_2.projects << @project
    @contestant_3.projects << @project
    @contestant_4.projects << @project
  end

  it 'can show the projects name, material, and the challenge that it belongs to' do
    visit "/projects/#{@project.id}"
    
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to have_content("Recycled Material")
  end
  
  it 'can see the total number of contestants on a project' do
    visit "/projects/#{@project.id}"
    
    # save_and_open_page
    expect(page).to have_content("4")
  end
  
  xit 'can see the average years of experience for contestants by project' do
    visit "/projects/#{@project.id}"
    
    expect(page).to have_content("12")
  end
end