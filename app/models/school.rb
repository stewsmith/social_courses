class School < ActiveRecord::Base
    has_many :courses
    has_many :instructors
end
