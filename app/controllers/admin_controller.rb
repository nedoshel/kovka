class AdminController < ApplicationController

  # http_basic_authenticate_with name: "kovka", password: "12345", except: :index
  http_basic_authenticate_with name: "kovka", password: "12345", except: :tags



  def tags
    tags = ActsAsTaggableOn::Tag.where("name LIKE '%#{params[:q]}%'").pluck :name
    render json: tags.map { |t| { id: t, text: t }}
  end

end
