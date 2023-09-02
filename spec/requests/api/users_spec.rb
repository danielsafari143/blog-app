require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path'/user/{user_id}/posts' do
        get 'Retrieve all the users' do
            tags 'Blogs'
            consumes 'application/json'
            parameter name: :user_id , in: :path, type: :string

            request_body_example value: [{"id":4,"title":"Bonjour","text":"lA GRANDE","comments_counter":11,"likes_counter":0,"created_at":"2023-09-01T10:36:45.941Z","updated_at":"2023-09-01T10:36:45.941Z","author_id":1}]

            response '200', 'blog found' do
                schema type: :object,
                  properties: {
                    id: { type: :integer },
                    title: { type: :string },
                    text: { type: :string }
                  },
                  required: [ 'id', 'title', 'text' ]

                run_test!
            end
        end
    end
end
