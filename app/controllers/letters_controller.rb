class LettersController < ApplicationController

	def index
  		@letters = Letter.where(user_id: params[:user_id])
	end

	def show
  		@letter = Letter.find(params[:id])
	end

	def new 
		@letters = Letter.new
	end

	def create
  		@letter = Letter.new(letter_params)
  		if @letter.save
    		redirect_to letters_path
  		else
    		render :new
  		end
	end

	def edit
  		@letter = Letter.find(params[:id])
	end

	def update
  		@letter = Letter.find(params[:id])

  		if @letter.update_attributes(letter_params)
    		redirect_to letters_path
  		else
    		render :edit
  		end
	end

	def destroy
  		@letter = Letter.find(params[:id])
  		@letter.destroy
  		redirect_to letters_path
	end


	private
		def letter_params
  		params.require(:letter).permit(:reciever, :title, :content)
	end
end
