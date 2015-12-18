Puppet::Functions.create_function(:to_resource) do
  dispatch :resolve do
    param 'String', :input
  end

  def resolve(input)
    call_function('resolve_resources', input)
  end
end
