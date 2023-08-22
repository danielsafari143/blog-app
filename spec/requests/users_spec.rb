require 'rails_helper'

describe "USERS CONTROLLER" do
    describe "get index" do
        it "returns http succes /users" do
            get '/users'
            expect(response).to have_http_status(:success)
            expect(response).to render_template('index')
            expect(response.body).to include('Here is a list of users')
        end

        it "return the correct template" do
            get '/users'
            expect(response).to render_template('index')
        end


        it "return http success for /users/:id" do
            get '/users/21'
            expect(response).to have_http_status(:success)
            expect(response.body).to include('Here is a user for a given userId')
        end

        it "return the correct template" do
            get '/users/21'
            expect(response).to render_template('show')
        end
    end
end