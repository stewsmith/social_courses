# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_file = File.join(Rails.root, 'db', 'seed.yml')
data = YAML::load_file(seed_file)

data['users'].each do |user|
    User.create(user)
end

data['friendships'].each do |friendship|
    Friendship.create ({
        :user_id => friendship["user"],
        :friend_id => friendship["friend"],
    })
end

data['schools'].each do |school|
    school_model = School.create(:name => school[:name])
    school["instructors"].each do |instructor|
        Instructor.create ({
            :name => instructor["name"],
            :school_id => school_model.id
        })
    end
    school["courses"].each do |course|
        course_model = Course.create ({
            :title => course["title"],
            :course_num => course["course_num"],
            :school_id => school_model.id
        })
        course["sessions"].each do |session|
            inst = Instructor.find_by_name(session["instructor"])
            session_model = CourseSession.create({
                :course_id => course_model.id,
                :instructor_id => inst.id,
                :term => session["term"]
            })
            session["reviews"].each do |review|
                user = User.find_by_email(review["user"])
                Review.create({
                    :course_session_id => session_model.id,
                    :user_id => user,
                    :score => review["score"],
                    :content => "Lorem Ipsum"
                })
            end
        end
    end
end
