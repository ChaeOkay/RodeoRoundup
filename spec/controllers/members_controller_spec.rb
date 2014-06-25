require 'spec_helper'

describe MembersController do

  context "GET show" do

    let!(:member) { FactoryGirl.create(:member) }

    before do
      get :show, id: member.id, format: :json
    end

    it "returns 200 on success" do
      expect(response.code).to eq "200"
    end

    it "includes the member id" do
      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq member.id
    end

    it "includes the member first name" do
      json_response = JSON.parse(response.body)
      expect(json_response['first_name']).to eq member.first_name
    end

    it "includes the member lastname" do
      json_response = JSON.parse(response.body)
      expect(json_response['last_name']).to eq member.last_name
    end
  end

end
