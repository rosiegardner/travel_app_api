require 'rails_helper'

describe "get all reviews route", :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 20)}

  before { get '/reviews' }

  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns one reviews' do
    get '/reviews/1'
    expect(JSON.parse(response.body).size).to eq(1)
  end
end

describe "get author by name", :type => :request do

  before do
    post '/reviews', params: { :author => 'Kyle Millhouse', :content => 'test_content' }
  end 

  it 'searches author by name' do
    get '/reviews?author=mill'
    puts response.body
    expect(JSON.parse(response.body)[0]['author']).to eq('Kyle Millhouse')
  end
end
  