class AdminController < ApplicationController

  # http_basic_authenticate_with name: "kovka", password: "12345", except: :index
  http_basic_authenticate_with name: "kovka", password: "12345", except: :tags



  def tags
    context = params[:t].to_s == 'price' ? 'prices' : 'tags'
    tags = ActsAsTaggableOn::Tag.includes(:taggings)
            .where(taggings: { context: context })
            .where("tags.name LIKE '%#{params[:q]}%'")
            .distinct
            .pluck ('tags.name')

    render json: tags.map { |t| { id: t, text: t }}
  end

end
