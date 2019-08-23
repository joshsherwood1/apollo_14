require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'class methods' do
    before(:each) do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: 'Commander')
      @john = Astronaut.create(name: "John Glenn", age: 35, job: 'Pilot')
      @neil_mission_1 = @neil.missions.create!(title: "Apollo 13", time_in_space: 444)
      @neil_mission_2 = @neil.missions.create!(title: "Capricorn 4", time_in_space: 222)
      @neil_mission_3 = @neil.missions.create!(title: "Zulu 1", time_in_space: 888)
    end
    it 'view astronaut missions in alphabetical order' do
      expect(@neil.missions.list_missions_in_alphabetical_order).to eq(["Apollo 13", "Capricorn 4", "Zulu 1"])
    end

    it 'view astronaut total mission time' do
      expect(@neil.missions.list_total_space_time).to eq(1554)
    end
  end
end
