# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SnapAPIClient do
  subject(:client) { described_class }

  it 'has a version number' do
    expect(SnapAPIClient::VERSION).not_to be nil
  end

  describe '.configuration' do
    it 'returns a configuration instance' do
      expect(client.configuration).to be_a(SnapAPIClient::Configuration)
    end
  end

  describe '.configure' do
    it 'yields the configuration object' do
      expect { |b| client.configure(&b) }.to yield_with_args(client.configuration)
    end
  end

  describe '.transport' do
    it 'returns a transport instance' do
      expect(client.transport).to be_a(SnapAPIClient::Transport)
    end
  end
end
