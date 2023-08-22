require 'rails_helper'

describe "users controller" do
    describe "get index" do
        it "returns http succes" do
            get '/users/23/posts'
            expect(response).to have_http_status(:success)
        end

        it "return http success for /users/:user_id/posts/:id" do
            get '/users/2/posts/21'
            expect(response).to have_http_status(:success)
        end
    end
end