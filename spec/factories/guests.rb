# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    email { Faker::Internet.email }
  end
end
