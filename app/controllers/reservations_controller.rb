# frozen_string_literal: true

class ReservationsController < ApplicationController
  def create
    authorize_action

    result = ReservationFactory.create(params[:payload])
    if result&.success?
      render :show, status: :ok, locals: { reservation: result.reservation }
    else
      render status: :unprocessable_entity, json: { errors: [I18n.t('reservation.create.failed')] }
    end
  end

  private

  def authorize_action(record = Reservation)
    authorize(record, "#{action_name}?", policy_class: policy_class)
  end

  def policy_class
    ReservationPolicy
  end
end
