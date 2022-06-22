class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end