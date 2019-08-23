require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    before(:each) do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: 'Commander')
      @john = Astronaut.create(name: "John Glenn", age: 35, job: 'Pilot')
      @ted = Astronaut.create(name: "Ted", age: 42, job: 'Astronaut')
    end
    it 'view average astronaut age for all astronauts' do
      expect(Astronaut.average_age).to eq(38)
    end
  end
end
