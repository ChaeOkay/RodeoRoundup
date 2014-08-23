require 'spec_helper'

describe Resource do
  describe 'group' do
    subject(:group) { described_class.group(resources: [:member, :organization]) }

    let(:all_organizations) { Organization.all }
    let!(:serialized_organizations) { OrganizationSerializer.new(all_organizations) }

    let(:all_members) { Member.all }
    let!(:serialized_member) { MemberSerializer.new(all_members) }

    let(:expected_hash) { { members: [serialized_member],
                            organizations: [serialized_organizations] } }

    it { expect(group).to eq(expected_hash) }
  end
end
