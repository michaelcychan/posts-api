require 'json'
require 'rest-client'

class ApiController < ApplicationController
  def index
  end

  def show

    parameters = ""
    if params[:tag]
      parameters += "tag=" + params[:tag]
    end

    @response = RestClient.get "https://api.hatchways.io/assessment/blog/posts?#{parameters}", {content_type: :json, accept: :json}
    @posts = JSON.parse(@response.body)["posts"]
    # Now @posts is an array of hash
    
    @posts.each do |post|
      puts "#{post}\n"
    end

    @posts.sort_by! {|post| post["likes"] }.reverse!

    render json: @posts
  end
end
