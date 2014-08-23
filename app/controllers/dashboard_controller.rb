class DashboardController < ApplicationController

  def index
    resources = Resources.group(params)
    render json: { dashboard: resources }
  end
end
