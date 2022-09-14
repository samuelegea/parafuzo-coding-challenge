class ParkingsController < ApplicationController
  before_action :set_parking, only: [:pay, :checkout]

  def plate_history
    @parkings = Parking.where(plate: params[:plate])

    render json: @parkings
  end

  def create
    @parking = Parking.new(parking_params)

    if @parking.save
      render json: @parking, status: :created
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  def pay
    @parking.update!(paid_at: Time.now)

    render json: @parking
  end

  def checkout
    if @parking.can_leave?
      @parking.update!(checkout_at: Time.now)

      render json: @parking
    else
      render json: { error: 'cannot checkout' }, status: :unprocessable_entity
    end
  end


  private
    def set_parking
      @parking = Parking.find(params[:id])
    end

    def parking_params
      params.require(:parking).permit(:plate)
    end
end
