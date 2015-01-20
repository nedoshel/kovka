class AdminController < ApplicationController

  # http_basic_authenticate_with name: "kovka", password: "12345", except: :index
  http_basic_authenticate_with name: "kovka", password: "12345", except: :tags



  def tags
    render json: [ {id: '1', text: '1'}, {id: '2', text: '2'} ]
  end

end
