require 'uri'
require 'rubygems'

# If the Kinetic Task version is under 4, load the openssl and json libraries
# because they are not included in the ruby version
if KineticTask::VERSION.split('.').first.to_i < 4
  # Load the JRuby Open SSL library unless it has already been loaded.  This
  # prevents multiple handlers using the same library from causing problems.
  if not defined?(Jopenssl)
    # Load the Bouncy Castle library unless it has already been loaded.  This
    # prevents multiple handlers using the same library from causing problems.
    # Calculate the location of this file
    handler_path = File.expand_path(File.dirname(__FILE__))
    # Calculate the location of our library and add it to the Ruby load path
    library_path = File.join(handler_path, 'vendor/bouncy-castle-java-1.5.0147/lib')
    $:.unshift library_path
    # Require the library
    require 'bouncy-castle-java'
    
    
    # Calculate the location of this file
    handler_path = File.expand_path(File.dirname(__FILE__))
    # Calculate the location of our library and add it to the Ruby load path
    library_path = File.join(handler_path, 'vendor/jruby-openssl-0.8.8/lib/shared')
    $:.unshift library_path
    # Require the library
    require 'openssl'
    # Require the version constant
    require 'jopenssl/version'
  end

  # Validate the the loaded openssl library is the library that is expected for
  # this handler to execute properly.
  if not defined?(Jopenssl::Version::VERSION)
    raise "The Jopenssl class does not define the expected VERSION constant."
  elsif Jopenssl::Version::VERSION != '0.8.8'
    raise "Incompatible library version #{Jopenssl::Version::VERSION} for Jopenssl.  Expecting version 0.8.8"
  end

  # Load the ruby JSON library unless it has already been loaded.  This prevents
  # multiple handlers using the same library from causing problems.
  if not defined?(JSON)
    # Calculate the location of this file
    handler_path = File.expand_path(File.dirname(__FILE__))
    # Calculate the location of our library and add it to the Ruby load path
    library_path = File.join(handler_path, 'vendor/json-1.8.0/lib')
    $:.unshift library_path
    # Require the library
    require 'json'
  end

  # Validate the the loaded JSON library is the library that is expected for
  # this handler to execute properly.
  if not defined?(JSON::VERSION)
    raise "The JSON class does not define the expected VERSION constant."
  elsif JSON::VERSION != '1.8.0'
    raise "Incompatible library version #{JSON::VERSION} for JSON.  Expecting version 1.8.0."
  end

  # Load the ruby Fog Openstack library unless it has already been loaded.  This prevents
  # multiple handlers using the same library from causing problems.
  if not defined?(Fog)
   
    # Calculate the location of this file
    handler_path = File.expand_path(File.dirname(__FILE__))
    # Calculate the location of our library and add it to the Ruby load path
    library_path = File.join(handler_path, 'vendor/fog-openstack/lib')
    $:.unshift library_path
    # Require the library
    require 'fog/openstack'
  end

  # Validate the the loaded Fog Openstack library is the library that is expected for
  # this handler to execute properly.
  if not defined?(Fog::Openstack::VERSION)
    raise "The Openstack CORE class does not define the expected VERSION constant."
  elsif Fog::Openstack::VERSION != '0.1.21'
    raise "Incompatible library version #{Fog::Openstack::VERSION} for Fog-Openstack.  Expecting version 0.1.21."
  end

end

# Load the ruby Multijson library unless it has already been loaded.  This 
# prevents multiple handlers using the same library from causing problems.
if not defined?(MultiJson)
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/multi_json-1.7.5/lib')
  $:.unshift library_path
  # Require the library
  require 'multi_json'
end

# Validate the the loaded MultiJson library is the library that is expected for
# this handler to execute properly.
if not defined?(MultiJson::Version)
  raise "The MultiJson class does not define the expected VERSION constant."
elsif MultiJson::Version.to_s != '1.7.5'
  raise "Incompatible library version #{MultiJson::Version} for MultiJson.  Expecting version 1.7.5."
end



# Load the ruby JMESPATH library unless it has already been loaded.  This prevents
# multiple handlers using the same library from causing problems.
if not defined?(JMESPath)
 
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/jmespath-1.0.2/lib')
  $:.unshift library_path
  # Require the library
  require 'jmespath'
end

# Validate the the loaded JMESPath library is the library that is expected for
# this handler to execute properly.
if not defined?(JMESPath::VERSION)
  raise "The JMESPath CORE class does not define the expected VERSION constant."
elsif JMESPath::VERSION != '1.0.2'
  raise "Incompatible library version #{JMESPath::VERSION} for JMESPath.  Expecting version 1.0.2."
end

# Load the ruby MultiXml library unless it has already been loaded.  This
# prevents multiple handlers using the same library from causing problems.
if not defined?(MultiXml)
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/multi_xml-0.5.5/lib')
  $:.unshift library_path
  # Require the library
  require 'multi_xml'
  require 'multi_xml/version'
end

# Validate the the loaded UUID Tools library is the library that is expected for
# this handler to execute properly.
if not defined?(MultiXml::VERSION)
  raise "The MultiXml class does not define the expected VERSION constant."
elsif MultiXml::VERSION != '0.5.5'
  raise "Incompatible library version #{MultiXml::VERSION} for OAuth2.  Expecting version 0.5.5."
end

# Load the ruby Fog Openstack library unless it has already been loaded.  This prevents
# multiple handlers using the same library from causing problems.
if not defined?(Fog)
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/fog-openstack/lib')
  $:.unshift library_path
  # Require the library
  require 'fog/openstack'
end

# Validate the the loaded Fog Openstack library is the library that is expected for
# this handler to execute properly.
if not defined?(Fog::Openstack::VERSION)
  raise "The Openstack CORE class does not define the expected VERSION constant."
elsif Fog::Openstack::VERSION != '0.1.21'
  raise "Incompatible library version #{Fog::Openstack::VERSION} for Fog-Openstack.  Expecting version 0.1.21."
end

# Load the ruby mime/types library unless 
# it has already been loaded.  This prevents multiple handlers using the same 
# library from causing problems.
if not defined?(MIME::Type)
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/mime-types-1.19/lib')
  $:.unshift library_path
  # Require the library
  require 'mime/types'
end

# Validate the the loaded mime/types library is the library that is expected for
# this handler to execute properly.
if not defined?(MIME::Type::VERSION)
  raise "The RestClient class does not define the expected VERSION constant."
# Ignore version compare
#elsif MIME::Type::VERSION.to_s != '1.19'
  #raise "Incompatible library version #{MIME::Type::VERSION} for mime/types.  Expecting version 1.19."
end


# Load the ruby rest-client library unless 
# it has already been loaded.  This prevents multiple handlers using the same 
# library from causing problems.
if not defined?(RestClient)
  # Calculate the location of this file
  handler_path = File.expand_path(File.dirname(__FILE__))
  # Calculate the location of our library and add it to the Ruby load path
  library_path = File.join(handler_path, 'vendor/rest-client-1.6.7/lib')
  $:.unshift library_path
  # Require the library
  require 'rest-client'
end

# Validate the the loaded rest-client library is the library that is expected for
# this handler to execute properly.
if not defined?(RestClient.version)
  raise "The RestClient class does not define the expected VERSION constant."
# Ignore version compare
#elsif RestClient.version.to_s != '1.6.7'
  #raise "Incompatible library version #{RestClient.version} for rest-client.  Expecting version 1.6.7."
end
