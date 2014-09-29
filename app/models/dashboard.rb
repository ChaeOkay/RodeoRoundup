class Dashboard
  attr_reader :resource

  def self.group(args)
    resources = args.fetch(:resources)

    mapped_resources = resources.map do |name|
      [name, new(resource: name).serialize_resource]
    end

    Hash[mapped_resources]
  end

  def initialize(args)
    @resource = args.fetch(:resource).singularize
  end

  def all_records
    eval(resource.classify).all
  end

  def resource_serializer
    eval("#{resource}Serializer".classify)
  end

  def serialize_resource
    ActiveModel::ArraySerializer.new(all_records,
                                     each_serializer: resource_serializer)
  end
end
