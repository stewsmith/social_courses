class Review < ActiveRecord::Base
    belongs_to :course_session, dependent: :destroy
    belongs_to :user, dependent: :destroy
end
