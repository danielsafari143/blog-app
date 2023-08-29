require 'rails_helper'

RSpec.describe 'Homepage', type: :user do
  it 'should have the title "Home"' do
    visit '/'
    title = page.title
    expect(title).to eq('BogAp')
  end
end