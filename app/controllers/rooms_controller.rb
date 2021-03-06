class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
    @roomsAdmin = Room.all
  end

  def show
    @pictures = @room.pictures
    

    @booked = Reservation.where("room_id = ? AND user_id = ?", @room.id, current_user.id).present? if current_user

    @reviews = @room.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save

      if params[:images] 
        params[:images].each do |image|
          @room.pictures.create(image: image)
        end
      end

      @pictures = @room.pictures
      redirect_to edit_room_path(@room), notice: "Successfully Saved"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id || current_user.admin?
      @pictures = @room.pictures
    else
      redirect_to root_path, notice: "You are not allowed to view the source."
    end
  end

  def update
    if @room.update(room_params)

      if params[:images] 
        params[:images].each do |image|
          @room.pictures.create(image: image)
        end
      end

      redirect_to edit_room_path(@room), notice: "Successfully Updated!"
    else
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id]) 
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :is_pets, :price, :active)
    end
end
