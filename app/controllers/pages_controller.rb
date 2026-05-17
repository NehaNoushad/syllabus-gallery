class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @programs = Program.all
  end
end
