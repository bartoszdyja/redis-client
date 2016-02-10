require 'rails_helper'

RSpec.feature "Objects", type: :feature do
  before :each do
    $redis = double
    allow($redis).to receive(:keys).and_return(['sample_key'])
    allow($redis).to receive(:set)
    allow($redis).to receive(:type).and_return('string')
    allow($redis).to receive(:get).and_return('sample_value')
  end
  it 'should add new records' do
    visit root_path
    expect(page).to have_content('Add new object')
    fill_in :key, with: 'sample key'
    fill_in :value, with: 'sample value'
    click_on 'Submit'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Add new object'
  end

  it 'should display keys' do
    visit root_path
    expect(page).to have_content 'sample_key Is a type of: string and has a value of: sample_value'
  end
end
