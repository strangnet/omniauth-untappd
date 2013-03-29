require 'spec_helper'

describe OmniAuth::Strategies::Untappd do

  subject do
    OmniAuth::Strategies::Untappd.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq 'untappd'
    end
  end
end