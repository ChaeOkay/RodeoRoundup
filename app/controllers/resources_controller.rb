class ResourcesController < ApplicationController

  def group
    resources = Resource.group(params)
    render json: { resources: resources }
  end
end
