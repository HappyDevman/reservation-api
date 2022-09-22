# frozen_string_literal: true

json.reservation do
  json.partial! 'reservations/reservation', reservation: reservation
end
