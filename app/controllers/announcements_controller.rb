class AnnouncementsController < ApplicationController
  before_action :require_admin

  def create
    @announcement = Current.user.announcements.build(announcement_params)
    if @announcement.save
      redirect_to root_path(anchor: "announcements"), notice: "Announcement posted."
    else
      redirect_to root_path(anchor: "announcements"), alert: @announcement.errors.full_messages.to_sentence
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to root_path(anchor: "announcements"), notice: "Announcement removed."
  end

  private

  def announcement_params
    params.expect(announcement: [:title, :content])
  end

  def require_admin
    redirect_to root_path, alert: "Admins only." unless Current.user&.admin?
  end
end
