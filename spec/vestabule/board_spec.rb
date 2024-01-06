# frozen_string_literal: true

require 'securerandom'

RSpec.describe Vestabule::Board do
  describe '#initialize' do
    let(:mock_key) { SecureRandom.uuid }

    context 'when API key is provided' do
      subject(:board) { described_class.new(mock_key) }

      it 'sets the reader' do
        expect(board.read_write_key).to eq(mock_key)
      end
    end

    context 'when API key is not provided but is present in the environment' do
      subject(:board) { described_class.new }

      before { stub_const('ENV', { 'VESTABULE_READ_WRITE_KEY' => mock_key }) }

      it 'uses the key set in the environment' do
        expect(board.read_write_key).to eq(mock_key)
      end
    end

    context 'when API key is not provided and is not present in the environmen' do
      it 'raises an error' do
        expect { described_class.new }.to raise_error(
          Vestabule::ApiKeyError,
          "Must be initialized with an API Read Write Key or have 'VESTABULE_READ_WRITE_KEY' set in the environment."
        )
      end
    end
  end
end
