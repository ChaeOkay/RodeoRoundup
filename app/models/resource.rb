class Resource

  attr_reader :dashboard

  def self.group(args)
    resources = args.fetch(:resources)
    Hash[resources.map { |name| [name.to_sym, new(resource: name).serialize_resource] }]
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

  def format_json
    { klass => all_records }
  end

  def serialize_dashboard
    # this is not working ?
    eval("#{klass}Serializer").new(all_records)
  end
end
