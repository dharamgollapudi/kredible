class School < ActiveRecord::Base
	validates :name, presence: true

	has_and_belongs_to_many :lenders

  class << self
    def search(name)
      schools = School.arel_table
      School.where(schools[:name].matches("%#{name}%"))
    end
  end
end
