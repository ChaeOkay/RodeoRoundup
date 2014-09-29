require 'spec_helper'

describe Dashboard do
  describe 'group' do
    let(:resource_1) { 'members' }
    let(:resource_2) { 'organizations' }
    let(:resource_serializer_1) { eval("#{resource_1.singularize}Serializer".classify) }
    let(:resource_serializer_2) { eval("#{resource_2.singularize}Serializer".classify) }

    let(:group) { described_class.new(resources: [resource_1, resource_2]) }
    let(:serialized_group) { group.serialized }
    let(:group_resource_1) { serialized_group[resource_1] }
    let(:group_resource_2) { serialized_group[resource_2] }

    it "returns a formatted response" do
      expect(group_resource_1).to be_a ActiveModel::ArraySerializer
      expect(group_resource_1.options[:each_serializer]).to eq resource_serializer_1
      expect(group_resource_2).to be_a ActiveModel::ArraySerializer
      expect(group_resource_2.options[:each_serializer]).to eq resource_serializer_2
    end
  end
end
