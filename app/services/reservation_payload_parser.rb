# frozen_string_literal: true

class ReservationPayloadParser < ApplicationService
  attr_reader :payload

  def initialize(payload)
    super
    @payload = payload
  end

  def call # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    obj_reservation = @payload[:reservation].presence || @payload

    {
      code: obj_reservation[:code] || obj_reservation[:reservation_code],
      start_date: obj_reservation[:start_date],
      end_date: obj_reservation[:end_date],
      nights: obj_reservation[:nights],
      adults: obj_reservation[:adults] || obj_reservation[:guest_details][:number_of_adults],
      children: obj_reservation[:children] || obj_reservation[:guest_details][:number_of_children],
      infants: obj_reservation[:infants] || obj_reservation[:guest_details][:number_of_infants],
      status: (obj_reservation[:status_type] || obj_reservation[:status]).to_sym,
      currency: obj_reservation[:host_currency] || obj_reservation[:currency],
      payout: obj_reservation[:expected_payout_amount] || obj_reservation[:payout_price],
      security: obj_reservation[:listing_security_price_accurate] || obj_reservation[:security_price],
      total: obj_reservation[:total_paid_amount_accurate] || obj_reservation[:total_price],
      guest: {
        first_name: obj_reservation[:guest_first_name] || obj_reservation[:guest][:first_name],
        last_name: obj_reservation[:guest_last_name] || obj_reservation[:guest][:last_name],
        email: obj_reservation[:guest_email] || obj_reservation[:guest][:email],
        phone: obj_reservation[:guest_phone_numbers] || [obj_reservation[:guest][:phone]]
      }
    }
  end
end
