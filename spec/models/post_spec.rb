require 'rails_helper'

RSpec.describe Post, type: :model do
  it'title should not be empty'do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  expect(first_post).to be_valid
end

it'comments_counter should not be less than 0' do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  first_post.comments_counter = -3
  expect(first_post).to_not be_valid
end

it'comments_counter should be an integer' do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  first_post.comments_counter = 'one'
  expect(first_post).to_not be_valid
end

it'comments_counter should be greater than or equal to 0' do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  first_post.comments_counter = 3
  expect(first_post).to be_valid
end

it'likes_counter should be an integer' do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  first_post.likes_counter = 'one'
  expect(first_post).to_not be_valid
end

it'likes_counter should be greater than or equal to 0' do
  first_post = Post.new(author_id: 1, title: 'Hello', text: 'This is my first post')
  first_post.likes_counter = 3
  expect(first_post).to be_valid
end
end
