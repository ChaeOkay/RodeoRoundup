require 'spec_helper'

describe MembersController do

  context 'GET show' do

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
