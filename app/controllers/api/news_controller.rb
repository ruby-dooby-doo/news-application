class Api::NewsController < ApplicationController
  def index
    # get the data
    response = Unirest.get("https://newsapi.org/v2/everything?q=#{params[:search_term]}&sortBy=publishedAt&apiKey=#{ENV['NEWS_API_KEY']}")
    @info = response.body
    render 'index.json.jbuilder'
  end
end
