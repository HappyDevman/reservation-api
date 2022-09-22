# frozen_string_literal: true

class ReservationFactory < ApplicationService
  attr_reader :payload

  def initialize(payload)
    super
    @payload = payload
  end

  def create
    ActiveRecord::Base.transaction do
      reservation_params = ReservationPayloadParser.call(payload)

      guest = Guest.find_or_initialize_by(email: reservation_params[:guest][:email])
      guest.update!(reservation_params[:guest])

      reservation = Reservation.find_or_initialize_by(code: reservation_params[:code])
      reservation.guest = guest
      reservation.update!(reservation_params.except(:guest))

      OpenStruct.new(success?: true, reservation: reservation)
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => e
      add_error(e.message)
      raise ActiveRecord::Rollback
    end
  end
end
