class ArticlesController < ApplicationController
  def index
    @articles = Article
                  .search_document(params[:title])
                  .records
                  .page(params[:page] || 1)
  end
end
