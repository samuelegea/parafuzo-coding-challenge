require 'chronic_duration'

class Parking
  include Mongoid::Document
  include Mongoid::Timestamps

  field :plate, type: String
  field :paid_at, type: Time
  field :checkout_at, type: Time

  validates :plate, presence: true
  validate :plate_format, on: :create

  def plate_format
    errors.add(:plate, 'is invalid') unless plate =~ /\A[A-Z]{3}-\d{4}\z/
  end

  def can_leave?
    paid_at.present? && checkout_at.blank?
  end
end
