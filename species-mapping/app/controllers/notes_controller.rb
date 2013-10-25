class NotesController < ApplicationController
http_basic_authenticate_with name: "whatif", password: "wechange", only: :destroy
  def create
    @record = Record.find(params[:record_id])
    @note = @record.notes.create(params[:note].permit(:author, :body))
    redirect_to record_path(@record)
  end
  
  def destroy
    @record = Record.find(params[:record_id])
    @note = @record.notes.find(params[:id])
    @note.destroy
    redirect_to record_path(@record)
  end
  
  def index
	@notes = Note.all
  end
end

