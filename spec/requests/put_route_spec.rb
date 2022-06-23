require 'rails_helper'

describe 'update a review route', :type => :request do

  before do
    post '/reviews', params: { :author => 'test_author', :content => 'test_content' }
    @review_id = JSON.parse(response.body)['id']
    patch "/reviews/#{@review_id}" , params: { :author => 'testie_author', :content => 'testie_content' }
    get "/reviews/#{@review_id}"
  end

  it 'updates the authors name' do
    puts(response.body)
    expect(JSON.parse(response.body)['author']).to eq('testie_author')
  end

  it 'updates the reviews content' do
    puts(response.body)
    expect(JSON.parse(response.body)['content']).to eq('testie_content')
  end

  it 'returns a success status' do
    expect(response).to have_http_status(:success)
  end

  it 'returns a success message' do
    patch "/reviews/#{@review_id}" , params: { :author => 'testie_author', :content => 'testie_content' }
    puts(response.body)
    expect(JSON.parse(response.body)['message']).to eq('This quote has been updated successfully.')
  end
end