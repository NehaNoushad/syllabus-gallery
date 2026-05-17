class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @programs = Program.all
    @notes    = Note.latest.includes(:user).limit(20)
    @new_note = Note.new if Current.user&.admin?
  end
end
