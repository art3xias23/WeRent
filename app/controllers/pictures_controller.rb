class PicturesController < ApplicationController

	def destroy
		@picture = Picture.find(params[:id])
		room = @picture.room

		@picture.destroy

		@pictures = Picture.where(room_id: room.id)

		respond_to :js
	end 

end 