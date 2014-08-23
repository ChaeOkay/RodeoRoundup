class Dashboard
  attr_reader :resource

  def self.group(args)
    resources = args.fetch(:resources)
    Hash[resources.map { |name| [new(resource: name).serialize_resource] }]  #how does the serializer convert to json?
  end

  def initialize(args)
    @resource = args.fetch(:resource)
  end

  def klass
    resource.to_s.capitalize
  end

  def all_records
    eval(klass).all
  end

  def serialize_resource
    eval("#{klass}Serializer").new(all_records)
  end
end
