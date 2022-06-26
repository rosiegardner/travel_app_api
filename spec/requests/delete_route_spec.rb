require 'rails_helper'

describe 'destroy a review route', :type => :request do

  before do
    post '/reviews', params: { :author => "test_author", :content => "test_content" }
    @review_id = JSON.parse(response.body)['id']
    delete "/reviews/#{@review_id}"
  end

  it 'returns a success status' do
    expect(response).to have_http_status(:success)
  end

  it 'returns a success message' do
    expect(JSON.parse(response.body)['message']).to eq('This review has been destroyed successfully.')
  end
end
  