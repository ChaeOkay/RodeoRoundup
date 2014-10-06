require 'spec_helper'

describe Dashboard do
  describe '#serialized' do
    let(:resources) { ['members', 'organizations'] }
    let(:dashboard) { described_class.new(resources: resources) }
    subject(:serialized_dashboard) { dashboard.serialized }

    before do
      FactoryGirl.build_stubbed(:member)
      FactoryGirl.build_stubbed_list(:organization, 3)
    end

    it 'includes each dashboard as the key' do
      expect(serialized_dashboard.size).to eq resources.size
    end

    it 'includes all members in the response' do
      members_serializer = serialized_dashboard['members']
      expect(members_serializer.object.size).to eq Member.all.size
    end

    it 'includes all organizations in the response' do
      organizations_serializer = serialized_dashboard['organizations']
      expect(organizations_serializer.object.size).to eq Organization.all.size
    end
  end
end
