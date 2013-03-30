require 'spec_helper'

describe OmniAuth::Strategies::Untappd do

  subject do
    OmniAuth::Strategies::Untappd.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq 'untappd'
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq 'https://untappd.com'
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq '/oauth/authenticate'
    end
  end
end