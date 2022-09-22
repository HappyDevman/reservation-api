# frozen_string_literal: true

json.extract! reservation,
              :id,
              :code,
              :start_date,
              :end_date,
              :nights,
              :guests,
              :status,
              :currency,
              :price,
              :created_at,
              :updated_at
json.guest do
  json.partial! 'reservations/guest', locals: { guest: reservation.guest }
end
