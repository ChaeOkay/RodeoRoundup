require 'spec_helper'

describe DashboardController do
  describe 'multiple dashboards members and organizations' do

    let!(:member1) { FactoryGirl.create(:member) }
    let!(:member2) { FactoryGirl.create(:member) }
    let!(:organization1) { FactoryGirl.create(:organization) }
    let!(:organization2) { FactoryGirl.create(:organization) }
    let!(:organization3) { FactoryGirl.create(:organization) }

    it 'includes each dashboard as the key' do
      get :index, dashboard: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['dashboard']
      expect(json_response.size).to eq 2
    end

    it 'includes all members in the response' do
      get :index, dashboard: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['dashboard'][0]['Member']
      expect(json_response.size).to eq Member.count
    end

    it 'includes all organizations in the response' do
      get :index, dashboard: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['dashboard'][1]['Organization']
      expect(json_response.size).to eq Organization.count
    end
  end
end
