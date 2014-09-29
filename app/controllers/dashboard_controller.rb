class DashboardController < ApplicationController

  def index
    resources = Dashboard.new(params)
    render json: resources.serialized
  end
end
