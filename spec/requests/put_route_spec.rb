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
end