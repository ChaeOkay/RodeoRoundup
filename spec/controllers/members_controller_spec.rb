require 'spec_helper'

describe MembersController do
  context 'GET #index' do

    before do
      FactoryGirl.create_list(:member, 3)
    end

    it 'returns 200 on success' do
      get :index, format: :json
      expect(response.code).to eq '200'
    end

    it 'returns 3 members' do
      get :index, format: :json
      json_response = JSON.parse(response.body)
      members = json_response['members']
      expect(members.size).to eq 3
    end
  end

  context 'GET #show' do
    let!(:member) { FactoryGirl.create(:member) }

    it 'returns 200 on success' do
      get :show, id: member.id, format: :json
      expect(response.code).to eq '200'
    end

    describe 'response attributes' do

      before do
        get :show, id: member.id, format: :json
        @response = JSON.parse(response.body)
      end

      it 'includes the member id' do
        expect(response['member']['id']).to eq member.id
      end

      it 'includes the member first name' do
        expect(response['member']['first_name']).to eq member.first_name
      end

      it 'includes the member last name' do
        expect(response['member']['last_name']).to eq member.last_name
      end
    end
  end

end
