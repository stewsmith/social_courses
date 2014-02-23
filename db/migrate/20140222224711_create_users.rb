class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :email
            t.string :name
            t.string :uid
            t.string :oauth_token
            t.datetime :oauth_expires_at

            t.timestamps
        end
        create_table :friendships do |t|
            t.integer :user_id
            t.integer :friend_id

            t.timestamps
        end
        create_table :schools do |t|
            t.string :name

            t.timestamps
        end
        create_table :courses do |t|
            t.string :title
            t.string :course_num

            t.references :school

            t.timestamps
        end
        create_table :instructors do |t|
            t.string :name

            t.references :school

            t.timestamps
        end
        create_table :course_sessions do |t|
            t.references :course
            t.references :instructor

            t.string :term

            t.timestamps
        end
        create_table :reviews do |t|
            t.references :course_session
            t.references :user

            t.integer :score
            t.text :content

            t.timestamps
        end
    end
end
