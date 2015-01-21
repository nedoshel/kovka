class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_url, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:name, :email, :phone, :product_id, :comment)
    end
end
