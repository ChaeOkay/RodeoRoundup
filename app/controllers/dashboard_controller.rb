class DashboardController < ApplicationController

  def index
    resources = Dashboard.group(params)
    render json: resources
  end
end
