Puppet::Functions.create_function(:resolve_resources) do
  dispatch :resolve do
    param 'Variant[Hash, Array, String]', :input
  end

  def resolve(input)
    case input
    when Hash
      Hash[input.map { |key,value| [resolve(key), resolve(value)] }]
    when Array
      input.map { |each| resolve(each) }
    when String
      to_resource(input)
    else
      input
    end
  end

  def to_resource(string)
    return string unless string.match /^[\w:]+\[.*\]$/
    begin
      Puppet::Resource.new(nil, string, {})
    rescue
      string
    end
  end
end
