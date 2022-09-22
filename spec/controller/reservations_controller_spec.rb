# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  before do
    allow(ReservationPolicy).to receive(:new).and_return(reservation_policy)
  end

  let(:reservation) { create(:reservation) }
  let(:guest) { create(:guest) }
  let(:reservation_policy) { instance_double(ReservationPolicy, create?: true) }

  let(:valid_payload) { eval(File.read('./spec/data/valid_payload_1.json')) }
  let(:invalid_payload) { eval(File.read('./spec/data/invalid_payload.json')) }

  describe 'POST create' do
    context 'with valid' do
      before do
        post :create, params: { payload: valid_payload }, format: :json
      end

      it { is_expected.to respond_with(:ok) }
      it { is_expected.to render_template(:show) }
    end

    context 'with invalid' do
      before do
        post :create, params: { payload: invalid_payload }, format: :json
      end

      it { is_expected.to respond_with(:unprocessable_entity) }
    end
  end
end
