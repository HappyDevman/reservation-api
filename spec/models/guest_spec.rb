# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'Table structure' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
  end

  describe 'Model relations' do
    it { is_expected.to have_many(:reservations).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
