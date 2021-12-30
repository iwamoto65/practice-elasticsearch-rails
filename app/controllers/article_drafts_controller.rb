class ArticleDraftsController < ApplicationController
  before_action :set_search_form_value, only: :index

  def index
    @article_drafts_count = ArticleDraft.all.size
    @q = ArticleDraft.ransack(params[:q])
    @article_drafts = @q.result(distinct: true)
                        .draft_status(params[:status] || "draft")
                        .page(params[:page] || 1)
  end

  def new
    @article_draft = ArticleDraft.new
  end

  def create
    article_draft = ArticleDraft.new(article_drafts_params)

    redirect_to article_drafts_url if article_draft.save!
  end

  def edit
    @article_draft = ArticleDraft.find(params[:id])
  end

  def update
    article_draft = ArticleDraft.find(params[:id])

    if article_draft.update!(article_drafts_params)
      redirect_to article_drafts_url
    end
  end

  def destroy
    article_draft = ArticleDraft.find(params[:id])

    if article_draft.destroy
      flash[:success] = '削除が成功しました'
      redirect_to article_drafts_url
    else
      flash[:danger] = '削除が失敗しました'
    end
  end

  def apploval
    return unless params[:confirm]

    article_draft = ArticleDraft.find(params[:id])

    ActiveRecord::Base.transaction do
      article_draft.status = "published"
      article_draft.save!
      create_article_model(article_draft)
    end
  end

  private

  def set_search_form_value
    params[:q] = { title_or_description_cont: "" } if params[:q].blank?
  end

  def article_drafts_params
    params.require(:article_draft).permit(:title, :description, :status)
  end

  def create_article_model(draft_model)
    article = Article.new({ title: draft_model.title, description: draft_model.description })

    if article.save!
      redirect_to articles_path
    else
      flash[:error] = "承認に失敗しました"
    end
  end
end
