require 'rails_helper'

RSpec.describe "ParkingsControllers", type: :request do
  let(:parking) { Parking.create(plate: 'ABC-1234') }
  let(:parking_params) { { plate: 'ABC-1234' } }
  let(:parking_params_invalid) { { plate: 'ABC1234' } }
  let(:paid_parking) { Parking.create(plate: 'ABC-1234', paid_at: Time.now) }

  describe "POST /parking" do
    context "when the plate is valid" do
      it "should create a parking" do
        post '/parking', params: parking_params
        expect(response).to have_http_status(201)
      end
    end

    context "when the plate is invalid" do
      it "should not create a parking" do
        post '/parking', params: parking_params_invalid
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /parking/:id/pay" do
    context "when the parking exists" do
      it "should pay the parking" do
        put "/parking/#{parking.id}/pay"
        expect(response).to have_http_status(200)
      end
    end

    context "when the parking is already paid" do
      it "should not pay the parking" do
        put "/parking/#{paid_parking.id}/pay"
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /parking/:id/out" do
    context "when the parking exists" do
      it "should checkout the parking" do
        put "/parking/#{paid_parking.id}/out"
        expect(response).to have_http_status(200)
      end
    end

    context "when the parking is not paid" do
      it "should not checkout the parking" do
        put "/parking/#{parking.id}/out"
        expect(response).to have_http_status(422)
      end
    end
  end
end
