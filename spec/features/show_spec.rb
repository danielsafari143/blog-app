require 'rails_helper'

RSpec.describe 'Homepage', type: :user do
  fake_user = User.create(name: 'Kena', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: fake_user, title: 'Hello', text: 'This is my first post')
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => first_post)
  Comment.create('text' => 'Bonjour les freres', 'author' => fake_user, 'post' => second_post)

  it 'has a profile picture' do
    visit "/users/#{fake_user.id}"

    users = page.all('.profile-picture')
    users.each do |profile_picture|
      expect(profile_picture).to have_css('img')
    end
  end

  it 'has a bio section' do
    visit "/users/#{fake_user.id}"

    expect(page).to have_css('div.bio')
    expect(page).to have_content('Bio')
    expect(page).to have_css('h3')
  end

  it 'shows the number of posts each user has written' do
    visit "/users/#{fake_user.id}"

    users = page.all('.number-of-posts')
    users.each do |number_of_posts|
      expect(number_of_posts).to have_content(number_of_posts.text)
    end
  end
 
  #-- rest of the code after this line
end
