class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @programs      = Program.all
    @announcements = Announcement.latest.includes(:user).limit(20)
    @new_announcement = Announcement.new if Current.user&.admin?
  end
end
