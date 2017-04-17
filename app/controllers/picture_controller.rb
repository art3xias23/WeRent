class PictureController < ApplicationController

	def destroy
		@picture = Picture.find(params[:id])
		room = @picturue.room

		@picture.destroy

		@pictures = Picture.where(room_id: room.id)

		respond_to :js
	end 

end 