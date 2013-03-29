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
      expect(subject.options.client_options.site).to eq 'http://untappd.com'
    end

    it 'should have correct authorize path' do
      expect(subject.options.client_options.authorize_path).to eq '/oauth/authenticate'
    end
  end
end