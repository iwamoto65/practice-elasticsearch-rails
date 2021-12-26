class ArticleDraftsController < ApplicationController
  def index
    @article_drafts = ArticleDraft.page(params[:page] || 1)
  end
end
