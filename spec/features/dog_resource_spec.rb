require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Dog resource', type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  before(:each) do
    login_as(user, scope: :user)
  end

  it 'can create a profile' do
    visit new_dog_path
    fill_in 'Name', with: 'Speck'
    fill_in 'Description', with: 'Just a dog'
    attach_file 'Image', 'spec/fixtures/images/speck.jpg'
    click_button 'Create Dog'
    expect(Dog.count).to eq(1)
  end

  it 'can edit a dog profile' do
    dog = create(:dog, user: user)
    visit edit_dog_path(dog)
    fill_in 'Name', with: 'Speck'
    click_button 'Update Dog'
    expect(dog.reload.name).to eq('Speck')
  end

  it 'can delete a dog profile' do
    dog = create(:dog, user: user)
    visit dog_path(dog)
    click_link "Delete #{dog.name}'s Profile"
    expect(Dog.count).to eq(0)
  end

  it 'can like a dog' do
    dog = create(:dog, user: other_user)
    visit dog_path(dog)
    click_button "like-button"
    expect(dog.likes.count).to eq(1)
  end

  it 'can unlike a dog' do
    dog = create(:dog, user: other_user)
    visit dog_path(dog)
    click_button "like-button"
    click_button "unlike-button"
    expect(dog.likes.count).to eq(0)
  end
end
