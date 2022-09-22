# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
