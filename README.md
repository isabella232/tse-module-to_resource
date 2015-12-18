# to\_resource #

This module provides two functions designed to assist with importing data that
represents Puppet resource types from external sources (or Hiera). This can be
specifically useful when trying to import application instance declarations,
which are required to specify the nodes parameter, which must be an array of
Node resource references.

## Functions ##

### to\_resource ###

Accepts a string parameter. Transforms it to a resource reference if the string
can be represented as a resource.

### resolve\_resources ###

Accepts either a String, Array, or Hash parameter. Recursively transforms all
transformable String sub-elements into resource type representations.

## Examples ##

Convert a single string to a resource reference:

    $res = "Notify[foo]".to_resource

Convert an array of strings to a resource reference:

    $res_arr = ["Notify[foo]", "Anchor[bar]"].resolve_resources

Look up a value and transform any valid string-form resource references it
contains to Resource type represenations:

    $app_instances = lookup("applications").resolve_resources
