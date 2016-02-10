require 'rails_helper'

RSpec.describe ObjectsController, type: :controller do
  before :each do
    $redis = double
  end
  it 'test' do
    expect(true).to be true
  end

  it 'assigns @redis variable' do
    allow( $redis ).to receive(:keys).and_return('some data')
    get :new
    expect(assigns(:redis)).to_not be_nil
  end

  it 'redirects to root path after creating record' do
    allow( $redis ).to receive(:set)
    post :create
    expect(response).to redirect_to root_path
  end
end
