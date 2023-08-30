require 'rails_helper'

RSpec.describe 'Homepage', type: :user do
  fake_user = User.create(name: 'Kena', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => first_post)
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => second_post)

  it 'shows the post\'s title' do
    visit "/users/#{fake_user.id}/posts/#{first_post.id}"
    expect(page).to have_content(first_post.title)
  end

  it 'shows who wrote the post' do
    visit "/users/#{fake_user.id}/posts/#{first_post.id}"
    expect(page).to have_content(first_post.author.name)
  end

  it 'shows how many comments it has' do
    visit "/users/#{fake_user.id}/posts/#{first_post.id}"
    expect(page).to have_content('comments: 1')
  end

  ##----- rest of the code after this comment line 
end
