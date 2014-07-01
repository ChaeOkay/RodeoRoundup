require 'spec_helper'

describe OrganizationsController do

  context 'GET index' do

    before do
      5.times { FactoryGirl.create(:organization) }
    end

    it 'returns 200 on success' do
      get :index, format: :json
      expect(response.code).to eq '200'
    end

    it 'returns 3 organizations' do
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq 5
    end
  end

  context 'GET show' do

    let!(:organization) { FactoryGirl.create(:organization) }

    it 'returns 200 on success' do
      get :show, id: organization.id, format: :json
      expect(response.code).to eq '200'
    end

    describe 'response attributes' do

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
