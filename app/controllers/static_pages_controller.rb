require 'fb_graph'
class StaticPagesController < ApplicationController
    def index
        if current_user
            fb_user = FbGraph::User.new('me', :access_token => current_user.oauth_token)
            fb_user.fetch()

            @friends = fb_user.friends()
            @picture = fb_user.picture(:access_token => current_user.oauth_token, :type => 'large')

            puts @picture
        end
    end
end
