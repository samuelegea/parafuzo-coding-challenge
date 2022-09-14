require 'rails_helper'

RSpec.describe Parking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:plate) }  
  end

  describe 'create a parking' do
    context 'when the plate is valid' do
      it 'should create a parking' do
        parking = Parking.create(plate: 'ABC-1234')
        expect(parking).to be_valid
      end
    end

    context 'when the plate is invalid' do
      it 'should not create a parking' do
        parking = Parking.create(plate: 'ABC1234')
        expect(parking).to_not be_valid
      end
    end
  end
end
