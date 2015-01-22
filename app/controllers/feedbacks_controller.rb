class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
    @product = Product.find params[:product_id]
    @feedback.product = @product
    render layout: false
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      render json: :ok
    else
      render :new
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:name, :email, :phone, :product_id, :comment)
    end
end
