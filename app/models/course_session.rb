class CourseSession < ActiveRecord::Base
    belongs_to :course, dependent: :destroy
    belongs_to :instructor, dependent: :destroy
    has_many :reviews
end
