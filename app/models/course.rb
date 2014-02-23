class Course < ActiveRecord::Base
    belongs_to :school, dependent: :destroy
    has_many :course_sessions
end
