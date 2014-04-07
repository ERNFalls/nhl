class NotesController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def find_noteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def index
	@noteable = find_noteable
    @noteable = @noteable.notes
  end

  def create
    @note = Note.new(note_params)
    if @note.save
	  redirect_to :back
    else
	  redirect_to :back
	  flash[:alert] = "Note " << @note.errors.full_messages.first.to_s
	end
  end

  def update
    @note = Note.find(params[:id])
	if @note.update(note_params)
      redirect_to :back
    else
      redirect_to :back
      flash[:alert] = "Note " << @note.errors.full_messages.first.to_s
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to :back
  end

  private
    def note_params
      params.require(:note).permit(:id, :user_id, :note, :noteable_id,
      :noteable_type, :created_at, :updated_at)
    end
end
