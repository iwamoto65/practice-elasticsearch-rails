class ArticlesController < ApplicationController
  def index
    @articles = Article.search_document(params[:title])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)

    if article.save!
      redirect_to articles_url
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])

    if article.update!(article_params)
      redirect_to articles_url
    end
  end

  def destroy
    article = Article.find(params[:id])

    if article.destroy
      flash[:success] = '削除が成功しました'
      redirect_to articles_url
    else
      flash[:danger] = '削除が失敗しました'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
