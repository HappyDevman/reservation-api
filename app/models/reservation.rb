# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :guest

  enum status: { pending: 0, accepted: 1 }

  store_accessor :guests, %i[adults children infants]
  store_accessor :price, %i[payout security total]

  validates :code, presence: true, uniqueness: true
end
