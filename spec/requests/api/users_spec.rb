require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path'/users/{user_id}/posts.json' do
        get 'Retrieve all the user\'s posts' do 
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

    path'/users/{user_id}/posts/{post_id}/comments.json' do
        get 'Retrieve all the user\'s post comment' do
            tags 'Blogs'
            consumes 'application/json'
            parameter name: :user_id , in: :path, type: :string 
            parameter name: :post_id , in: :path, type: :string 

            request_body_example value: [{"id":7,"text":"Bonjour","created_at":"2023-09-01T13:07:17.183Z","updated_at":"2023-09-01T13:07:17.183Z","author_id":2,"post_id":4},{"id":8,"text":"Salut la famille ","created_at":"2023-09-01T13:08:18.066Z","updated_at":"2023-09-01T13:08:18.066Z","author_id":2,"post_id":4},{"id":9,"text":"Grande","created_at":"2023-09-01T13:54:46.800Z","updated_at":"2023-09-01T13:54:46.800Z","author_id":1,"post_id":4}]

            response '200', 'blog found' do
                schema type: :object,
                  properties: {
                    id: { type: :integer },
                    text: { type: :string }
                  },
                  required: [ 'id', 'text' ]

                run_test!
            end
        end

        post 'Add a comment to a user\'s post' do
            tags 'Blogs'
            consumes 'application/json'
            parameter name: :user_id , in: :path, type: :string 
            parameter name: :post_id , in: :path, type: :string 

            parameter name: :text, in: :body, schema: {
                type: :object,
                properties: {
                  text: { type: :string }
                },
                required: [ 'text' ]
              }
        
              response '201', 'Post created' do
                let(:blog) { { text:'Hi' } }
                run_test!
              end
        end
    end
end
