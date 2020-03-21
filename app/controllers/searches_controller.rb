class SearchesController < ApplicationController
  
  def new
    @word = params[:search]
    @search_items = Micropost.search(@word).paginate(page: params[:page])
  end
  
end
