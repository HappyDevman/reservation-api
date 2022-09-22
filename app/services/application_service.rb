# frozen_string_literal: true

class ApplicationService
  attr_reader :errors

  def initialize(...)
    @errors = []
  end

  def self.call(...)
    new(...).call
  end

  def self.create(...)
    new(...).create
  end

  protected

  def add_error(message)
    @errors.push(message)
  end
end
