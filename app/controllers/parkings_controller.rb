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
    if @parking.paid_at?
      render json: { 'message': 'Already Paid' }, status: :unprocessable_entity
    else
      @parking.update!(paid_at: Time.now)
      render json: @parking
    end
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
      params.permit(:plate)
    end
end
