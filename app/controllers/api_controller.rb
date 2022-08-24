require 'json'
require 'rest-client'

class ApiController < ApplicationController
  def index
  end

  def show
    puts params[:tag]
    parameters = ""
    if params[:tag]
      parameters += "tag=" + params[:tag]
    end
    puts parameters

    @response = RestClient.get "https://api.hatchways.io/assessment/blog/posts?#{parameters}", {content_type: :json, accept: :json}
    

    @posts = JSON.parse(@response.body)["posts"]

    render json: @posts
  end
end
