class Admin::FeedbacksController < AdminController

  def index
    @feedbacks = Feedback.includes(:product).paginate(page: params[:page], per_page: 50).order('id DESC')
  end

end
