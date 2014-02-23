class ReviewsController < ApplicationController
    def course
        @id = params[:id]

        @course = Course.includes(:course_sessions => :reviews).find(@id)
    end
end
