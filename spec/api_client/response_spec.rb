# frozen_string_literal: true

require 'spec_helper'

module SnapAPIClient
  RSpec.describe Response do
    subject(:response) { described_class.new(http) }

    describe '#code' do
      let(:status) { instance_double(HTTP::Response::Status, code: 204) }
      let(:http) { instance_double(HTTP::Response, status: status) }

      it 'returns the status code from the HTTP response' do
        expect(response.code).to be(204)
      end
    end

    describe '#body_json' do
      subject(:body_json) { response.body_json }

      let(:http) { instance_double(HTTP::Response, body: json) }

      context 'when the HTTP response has a valid JSON body' do
        let(:json) { '{"field":"value"}' }

        it 'parses and returns the JSON object' do
          expect(body_json).to eql(JSON.parse(json))
        end
      end

      context 'when the HTTP response does not contain a valid JSON body' do
        let(:json) { 'invalid-json-string' }

        it 'raises a JSON parser error' do
          expect { body_json }.to raise_error(JSON::ParserError)
        end
      end
    end
  end
end
