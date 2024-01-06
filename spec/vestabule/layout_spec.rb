# frozen_string_literal: true

require 'securerandom'

RSpec.describe Vestabule::Layout do
  subject(:layout) { described_class.new(rows) }

  let(:rows) do
    <<~ROWS.gsub("\n", '').gsub(' ', '')
      [
        [0,0,63,63,63,0,0,64,64,64,0,0,67,67,67,0,66,66,0,66,66,0],
        [0,63,63,0,63,63,64,64,0,64,64,67,67,0,67,67,66,66,0,66,66,0],
        [0,0,0,0,63,63,64,64,0,64,64,0,0,0,67,67,66,66,0,66,66,0],
        [0,0,0,63,63,0,64,64,0,64,64,0,0,67,67,0,66,66,66,66,66,0],
        [0,0,63,63,0,0,64,64,0,64,64,0,67,67,0,0,0,0,0,66,66,0],
        [0,63,63,63,63,63,0,64,64,64,0,67,67,67,67,67,0,0,0,66,66,0]
      ]
    ROWS
  end

  describe '#initialize' do
    it 'sets the rows as a reader' do
      expect(layout.rows).to eq(rows)
    end
  end

  describe '#to_text' do
    it 'prints the layout as readable text' do
      expect(layout.to_text).to eq
    end
  end
end
