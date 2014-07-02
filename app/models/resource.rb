class Resource

  attr_reader :resource

  def self.group(args)
    resources = args.fetch(:resources)
    resource_collection = resources.map { |name| new(resource: name) }
    resource_collection.map(&:format_json)
  end

  def initialize(args)
    @resource = args.fetch(:resource)
  end

  def klass
    resource.capitalize
  end

  def all_records
    eval(klass).all
  end

  def format_json
    { klass => all_records }
  end

  def read_attribute_for_serialization
  end
end
