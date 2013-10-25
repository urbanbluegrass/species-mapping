class RecordsController < ApplicationController
	http_basic_authenticate_with name: "whatif", password: "wechange", except: [:index, :show]
	def new
	  @record = Record.new
	end
	
	def show
	  @record = Record.find(params[:id])
	end
	
	def index
	  @records = Record.all
	end
	def edit
		@record = Record.find(params[:id])
	end
	def update
	  @record = Record.find(params[:id])
	 
	  if @record.update(params[:record].permit(:title, :text))
		redirect_to @record
	  else
		render 'edit'
	  end
	end
	
	def destroy
	  @record = Record.find(params[:id])
	  @record.destroy
	 
	  redirect_to records_path
	end
	
	def create
		@record = Record.new(params[:record].permit(:title, :text))
		if @record.save
			redirect_to @record
		else
			render 'new'
		end
	end
	 
	private
	  def record_params
		params.require(:record).permit(:title, :text)
	  end
end
