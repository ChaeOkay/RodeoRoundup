class DashboardResourceCollection
  attr_reader :resource

  def self.serialize(resource)
    new(resource).serialize
  end

  def initialize(resource)
    @resource = resource.singularize
  end

  def serialize
    ActiveModel::ArraySerializer.new(all_records,
                                     each_serializer: resource_serializer)
  end

  private

  def all_records
    eval(resource.classify).all
  end

  def resource_serializer
    eval("#{resource}Serializer".classify)
  end
end
