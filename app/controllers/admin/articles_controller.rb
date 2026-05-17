class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:edit, :update, :destroy, :publish, :unpublish]

  def index
    @articles = Article.order(updated_at: :desc)
  end

  def new
    @article = Current.user.articles.build(kind: "project")
  end

  def create
    @article = Current.user.articles.build(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: "Article saved as draft."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: "Article updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: "Article deleted."
  end

  def publish
    @article.update(published_at: Time.current)
    redirect_to admin_articles_path, notice: "Published."
  end

  def unpublish
    @article.update(published_at: nil)
    redirect_to admin_articles_path, notice: "Moved back to drafts."
  end

  private

  def set_article
    @article = Article.find_by!(slug: params[:id])
  end

  def article_params
    params.expect(article: [:title, :slug, :kind, :excerpt, :body, :published_at])
  end
end
