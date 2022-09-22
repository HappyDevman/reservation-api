# frozen_string_literal: true

class ReservationPolicy < ApplicationPolicy
  def create?
    true
  end
end
