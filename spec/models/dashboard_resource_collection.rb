require 'spec_helper'

describe DashboardResourceCollection do
  describe '#serialize' do

    before do
      FactoryGirl.build_stubbed_list(:member, 2)
    end

    let(:resource) { 'members' }
    subject(:dashboard_resource_collection) { described_class.serialize(resource) }

    it 'returns all resource records' do
      expect(dashboard_resource_collection.object.size).to eq Member.all.size
    end

    it 'uses the resource serializer' do
      serializer = dashboard_resource_collection.options[:each_serializer]
      expect(serializer).to eq MemberSerializer
    end
  end
end
