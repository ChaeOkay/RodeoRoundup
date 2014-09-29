class Dashboard
  attr_reader :resources, :serializer

  def initialize(args, serializer: DashboardResourceCollection)
    @resources = args.fetch(:resources)
    @serializer = serializer
  end

  def serialized
    Hash[serialized_resources]
  end

  private

  def serialized_resources
    resources.map do |name|
      [name, serializer.serialize(name)]
    end
  end
end
