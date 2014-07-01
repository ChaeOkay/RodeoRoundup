require 'spec_helper'

describe OrganizationsController do

  context 'GET show' do

    let!(:organization) { FactoryGirl.create(:organization) }

    it 'returns 200 on success' do
      get :show, id: organization.id, format: :json
      expect(response.code).to eq '200'
    end

    describe 'attributes' do

      before do
        get :show, id: organization.id, format: :json
        @response = JSON.parse(response.body)
      end

      it 'includes the organization id' do
        expect(response['organization']['id']).to eq organization.id
      end

      it 'includes the organization name' do
        expect(response['organization']['name']).to eq organization.name
      end

      it 'includes the organization address' do
        expect(response['organization']['address_1']).to eq organization.address_1
        expect(response['organization']['address_2']).to eq organization.address_2
      end

      it 'includes the city' do
        expect(response['organization']['city']).to eq organization.city
      end

      it 'includes the state' do
        expect(response['organization']['state']).to eq organization.state
      end

      it 'includes the zip' do
        expect(response['organization']['zip']).to eq organization.zip
      end

      it 'includes the phone' do
        expect(response['organization']['phone']).to eq organization.phone
      end
    end
  end

end
