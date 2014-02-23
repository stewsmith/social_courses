class ReviewsController < ApplicationController
    def course
        course_id = params[:course_id]

        @course = Course.includes(:course_sessions => :reviews).find(course_id)
    end

    def instructor
        instructor_id = params[:instructor_id]

        @instructor = User.includes(:reviews).find(instructor_id)
    end
end
