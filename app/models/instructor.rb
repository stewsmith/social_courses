class Instructor < ActiveRecord::Base
    belongs_to :school, dependent: :destroy
end
