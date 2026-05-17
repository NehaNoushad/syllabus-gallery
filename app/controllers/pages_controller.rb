class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @programs = Program.all
    @articles = Article.published.limit(6)
  end
end
