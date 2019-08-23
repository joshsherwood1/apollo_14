require 'rails_helper'

RSpec.describe "Astronaut Index Page" do
  before(:each) do
    @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: 'Commander')
    @john = Astronaut.create(name: "John Glenn", age: 35, job: 'Pilot')
    @neil_mission_1 = @neil.missions.create!(title: "Apollo 13", time_in_space: 444)
    @neil_mission_2 = @neil.missions.create!(title: "Capricorn 4", time_in_space: 222)
    @john_mission_1 = @john.missions.create!(title: "Zulu 1", time_in_space: 555)
    @john_mission_2 = @john.missions.create!(title: "Gemini 7", time_in_space: 333)


  end
  it "can list all astronauts and their info" do
    visit '/astronauts'
    expect(page).to have_content(@neil_mission_1.title)
    expect(page).to have_content(@neil_mission_2.title)
    expect(page).to have_content(@john_mission_1.title)
    expect(page).to have_content(@john_mission_2.title)

  end

    it "can list all astronauts and their info" do
      visit '/astronauts'
      expect(page).to have_content("Average Age of Astronauts: 36")
    end

    it "can list all missions of astronauts" do
      visit '/astronauts'
      expect(page).to have_content(@neil.name)
      expect(page).to have_content("Age: #{@neil.age}")
      expect(page).to have_content(@neil.job)
      expect(page).to have_content(@john.name)
      expect(page).to have_content("Age: #{@john.age}")
      expect(page).to have_content(@john.job)
    end

    it "can list total mission time of each astronaut" do
      visit '/astronauts'
      expect(page).to have_content("Total Mission Time: 666 days")
      expect(page).to have_content("Total Mission Time: 888 days")
    end
end
