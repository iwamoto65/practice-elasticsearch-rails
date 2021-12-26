class ArticleDraftsController < ApplicationController
  def index
    @article_drafts = ArticleDraft.not_apploved.page(params[:page] || 1)
  end

  def apploval
    return unless params[:confirm]

    article_draft = ArticleDraft.find(params[:id])
    ActiveRecord::Base.transaction do
      article_draft.status = 1
      article_draft.save!
      create_article_model(article_draft)
    end
  end

  private

  def create_article_model(draft_model)
    article = Article.new({ title: draft_model.title, description: draft_model.description })

    if article.save!
      redirect_to articles_path
    else
      flash[:error] = "承認に失敗しました"
    end
  end
end
