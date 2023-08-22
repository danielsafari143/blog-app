require 'rails_helper'

describe "users controller" do
    describe "get index" do
        it "returns http succes /users" do
            get '/users'
            expect(response).to have_http_status(:success)
            expect(request.body).to(eq('Daniel'))
        end

        it "return http success for /users/:id" do
            get '/users/21'
            expect(response).to have_http_status(:success)
            expect(request.body).to(eq('La rose'))
        end
    end
end