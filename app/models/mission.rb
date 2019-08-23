class Mission < ApplicationRecord
  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions
  validates_presence_of :title, :time_in_space

  def self.list_missions_in_alphabetical_order
    order(:title).pluck(:title)
  end

  def self.list_total_space_time
    pluck(:time_in_space).sum
  end
end
