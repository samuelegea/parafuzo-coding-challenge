class ParkingSerializer < ActiveModel::Serializer
  attribute(:id) { object._id.to_s }
  attribute(:time) { ChronicDuration.output(((object.checkout_at || Time.now) - object.created_at), units: 1, format: :long) }
  attribute(:left) { object.checkout_at.present? }
  attribute(:paid) { object.paid_at.present? }
end
