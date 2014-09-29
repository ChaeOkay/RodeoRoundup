require 'spec_helper'

describe Dashboard do
  describe 'group' do
    let(:resource_1) { 'members' }
    let(:resource_2) { 'organizations' }
    let(:resource_serializer_1) { eval("#{resource_1.singularize}Serializer".classify) }
    let(:resource_serializer_2) { eval("#{resource_2.singularize}Serializer".classify) }

    subject(:group) { described_class.group(resources: [resource_1, resource_2]) }
    let(:group_resource_1) { group[resource_1] }
    let(:group_resource_2) { group[resource_2] }

    it "returns an ActiveModel::ArraySerializer for the given resources" do
      expect(group_resource_1).to be_a ActiveModel::ArraySerializer
      expect(group_resource_1.options[:each_serializer]).to eq resource_serializer_1
      expect(group_resource_2).to be_a ActiveModel::ArraySerializer
      expect(group_resource_2.options[:each_serializer]).to eq resource_serializer_2
    end
  end
end
