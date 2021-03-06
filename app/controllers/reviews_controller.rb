class ReviewsController < ApplicationController

  def index
    if author = params[:author]
      @reviews = Review.search(author)
    elsif params[:page].present?
      @reviews = Review.order('author ASC').paginate(:page => params[:page], per_page:10)
    else
      @reviews = Review.all
    end
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "This review has been updated successfully."
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
        message: "This review has been destroyed successfully."
      }
    end
  end

  private
  
  def review_params
    params.permit(:author, :content)
  end

  
end