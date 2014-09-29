require 'spec_helper'

describe Dashboard do
  describe '#serialized' do
    let!(:member1) { FactoryGirl.create(:member) }
    let!(:member2) { FactoryGirl.create(:member) }
    let!(:organization1) { FactoryGirl.create(:organization) }
    let!(:organization2) { FactoryGirl.create(:organization) }
    let!(:organization3) { FactoryGirl.create(:organization) }

    let(:dashboard) { described_class.new(resources: ['members', 'organizations']) }
    subject(:serialized_dashboard) { dashboard.serialized }

    it 'includes each dashboard as the key' do
      expect(serialized_dashboard.size).to eq 2
    end

    it 'includes all members in the response' do
      members_serializer = serialized_dashboard['members']
      expect(members_serializer.object.size).to eq Member.count
    end

    it 'includes all organizations in the response' do
      organizations_serializer = serialized_dashboard['organizations']
      expect(organizations_serializer.object.size).to eq Organization.count
    end
  end
end
