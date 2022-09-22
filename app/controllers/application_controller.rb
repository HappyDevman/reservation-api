# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authorize(record, action_name, policy_class); end

  def user_not_authorized
    Rails.logger << '========== Not authorized! ==========='
  end
end
