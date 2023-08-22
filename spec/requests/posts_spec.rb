require 'rails_helper'

describe "POSTS CONTROLLER" do
    describe "get index" do
        it "returns http succes" do
            get '/users/23/posts'
            expect(response).to have_http_status(:success)
            expect(response.body).to include('Here is a list of posts for a given user')
        end

        it "return http success for /users/:user_id/posts/:id" do
            get '/users/2/posts/21'
            expect(response).to have_http_status(:success)
            expect(response.body).to include('Get a post for a given postId')
        end
    end
end