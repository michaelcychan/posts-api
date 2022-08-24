require 'json'
require 'rest-client'

class ApiController < ApplicationController
  def index
  end

  def show

    parameters = ""
    if params[:tag]
      parameters += "tag=" + params[:tag]
    else
      parameters += "tag=tech"
    end

    @response = RestClient.get "https://api.hatchways.io/assessment/blog/posts?#{parameters}", {content_type: :json, accept: :json}
    @posts = JSON.parse(@response.body)["posts"]
    # Now @posts is an array of hash

    @posts.sort_by! {|post| post["likes"] }.reverse!

    if params[:minread]
      @posts = @posts.filter {|post| post["reads"] > params[:minread].to_i}
    end

    if params[:postCount]
      posts_per_page = params[:postCount].to_i
      page = 0
      if params[:page]
        page = params[:page].to_i
      end
      page = 1 if page < 1
      head = (page - 1) * posts_per_page
      @posts = @posts[head, posts_per_page]
    end

    render json: @posts
  end
end
