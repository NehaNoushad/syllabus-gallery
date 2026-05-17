class ArticlesController < ApplicationController
  allow_unauthenticated_access

  def index
    @articles = Article.published
  end

  def show
    @article = Article.find_by!(slug: params[:id])
    redirect_to root_path, alert: "That article isn't published." and return unless @article.published? || Current.user&.admin?
  end
end
