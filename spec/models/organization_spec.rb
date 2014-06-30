require 'spec_helper'

describe Organization do

  it 'has a valid Factory' do
    FactoryGirl.create(:organization).should be_valid
  end
end
