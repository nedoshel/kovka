class AdminController < ApplicationController

  # http_basic_authenticate_with name: "kovka", password: "12345", except: :index
  http_basic_authenticate_with name: "kovka", password: "12345"

end
