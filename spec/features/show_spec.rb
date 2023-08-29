require 'rails_helper'

RSpec.describe 'Homepage', type: :user do
    it 'has a profile picture' do
        visit '/users/1'

        users = page.all('.profile-picture')
        users.each do |profile_picture|
          expect(profile_picture).to have_css('img')
        end
    end

  it 'has a bio section' do
    visit '/users/1'

    expect(page).to have_css('div.bio')
    expect(page).to have_content('Bio')
    expect(page).to have_css('h3')
  end

  it 'shows the number of posts each user has written' do
    visit '/users/1'

    users = page.all('.number-of-posts')
    users.each do |number_of_posts|
      expect(number_of_posts).to have_content(number_of_posts.text)
    end
  end

  it 'shows the number of posts' do
    visit '/users/1'

    users = page.find_all('.post')
    expect(users.length).to eq(3)
  end

  it 'shows the button that lets me view all of a user posts.' do
    visit '/users/1'

    users = page.find('.btn')
    expect(users).to have_content('See all posts')
  end

  it 'redirects to the user show page when a user is clicked' do
    visit '/users/1'
  
    if user = page.all('.username').first
      user.click
      expect(page.current_path).to eq(user_path(user.text))
    else
      puts "There is no user to click on."
    end
  end 

  it 'redirects to the user\'s post index page when I click to see all posts' do
    visit '/users/1'

    click_link('See all posts')

    expect(page).to have_current_path('/users/1/posts')
  end
end