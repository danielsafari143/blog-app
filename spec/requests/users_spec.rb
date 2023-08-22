require 'rails_helper'

describe "users controller" do
    describe "get index" do
        it "returns http succes /users" do
            get '/users'
            expect(response).to have_http_status(:success)
        end

        it "shoud return the correct label" do
            get '/users'
            expect(response.body).to include('Here is a list of users')
        end

        it "return http success for /users/:id" do
            get '/users/21'
            expect(response).to have_http_status(:success)
        end

        it "shoud return the correct label" do
            get '/users/21'
            expect(response.body).to include('Here is a user for a given userId')
        end
    end
end