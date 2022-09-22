# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservationFactory, type: :service do
  let(:payload1) { eval(File.read('./spec/data/valid_payload_1.json')) }
  let(:payload2) { eval(File.read('./spec/data/valid_payload_2.json')) }

  describe '#create' do
    context 'with valid' do
      it 'returns reservation #1' do
        result = described_class.create(payload1)
        expect(result.success?).to be_truthy
        expect(result.reservation.code).to eq(payload1[:reservation_code])
      end

      it 'returns reservation #2' do
        result = described_class.create(payload2)
        expect(result.success?).to be_truthy
        expect(result.reservation.code).to eq(payload2[:reservation][:code])
      end
    end

    context 'with invalid' do
      it 'returns error' do
        result = described_class.create(payload1.except(:reservation_code))
        expect(result).to be_nil
      end
    end
  end
end
