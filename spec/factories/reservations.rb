# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    association :guest

    code { Faker::Lorem.characters(32) }
  end
end
