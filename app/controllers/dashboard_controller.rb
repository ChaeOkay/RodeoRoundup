class DashboardController < ApplicationController

  def index
    resources = Dashboard.group(params)
    render json: { dashboard: resources }
  end
end
