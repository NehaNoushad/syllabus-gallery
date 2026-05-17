class NotesController < ApplicationController
  before_action :require_admin

  def create
    @note = Current.user.notes.build(note_params)
    if @note.save
      redirect_to root_path(anchor: "notes"), notice: "Note posted."
    else
      redirect_to root_path(anchor: "notes"), alert: @note.errors.full_messages.to_sentence
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path(anchor: "notes"), notice: "Note removed."
  end

  private

  def note_params
    params.expect(note: [:title, :content])
  end

  def require_admin
    redirect_to root_path, alert: "Admins only." unless Current.user&.admin?
  end
end
