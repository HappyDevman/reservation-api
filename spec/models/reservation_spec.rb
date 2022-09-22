# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:start_date).of_type(:date) }
    it { is_expected.to have_db_column(:end_date).of_type(:date) }
    it { is_expected.to have_db_column(:nights).of_type(:integer) }
    it { is_expected.to have_db_column(:guests).of_type(:jsonb) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:currency).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:jsonb) }
  end

  describe 'Model relations' do
    it { is_expected.to belong_to(:guest) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:code) }
  end
end
