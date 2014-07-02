require 'spec_helper'

describe ResourcesController do
  describe 'multiple resources members and organizations' do

    let!(:member1) { FactoryGirl.create(:member) }
    let!(:member2) { FactoryGirl.create(:member) }
    let!(:organization1) { FactoryGirl.create(:organization) }
    let!(:organization2) { FactoryGirl.create(:organization) }
    let!(:organization3) { FactoryGirl.create(:organization) }

    it 'includes each resource as the key' do
      get :group, resources: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['resources']
      expect(json_response.size).to eq 5
    end

    it 'includes all members in the response' do
      get :group, resources: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['resources'][0]['Member']
      expect(json_response.size).to eq 2
    end

    it 'includes all organizations in the response' do
      get :group, resources: ["member", "organization"], format: :json
      json_response = JSON.parse(response.body)['resources'][1]['Organization']
      expect(json_response.size).to eq 3
    end
  end
end
