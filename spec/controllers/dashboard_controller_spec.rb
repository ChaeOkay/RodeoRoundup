require 'spec_helper'

describe DashboardController do

  describe '#index' do
    let!(:member) { FactoryGirl.create_list(:member, 2) }
    let!(:organization) { FactoryGirl.create_list(:organization, 3) }

    it 'returns 200 with valid params' do
      valid_params = { resources: ['members', 'organizations'] }
      get :index, valid_params, format: :json
      expect(response.code).to eq '200'
    end
  end
end
