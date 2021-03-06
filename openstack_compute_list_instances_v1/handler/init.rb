require File.expand_path(File.join(File.dirname(__FILE__), 'dependencies'))

class OpenstackComputeListInstancesV1

  def initialize(input)
    # Set the input document attribute
    @input_document = REXML::Document.new(input)
    
    # Store the info values in a Hash of info names to values.
    @info_values = {}
    REXML::XPath.each(@input_document,"/handler/infos/info") { |item|
      @info_values[item.attributes['name']] = item.text  
    }
    
    # Retrieve all of the handler parameters and store them in a hash attribute
    # named @parameters.
    @parameters = {}
    REXML::XPath.match(@input_document, 'handler/parameters/parameter').each do |node|
      @parameters[node.attribute('name').value] = node.text.to_s
    end

    @enable_debug_logging = @info_values['enable_debug_logging'] == 'Yes'
    puts "#{@parameters}" if @enable_debug_logging
    
   
    
    
      
    @auth_url = @parameters['openstack_url']
    @username = @info_values['username']
    @password = @info_values['pw']
    @project_name   = @parameters['project_name'] # String
    @domain   = @parameters['default']
    @compute_client = Fog::Compute.new({:provider => "openstack",
                                       :openstack_auth_url => @auth_url  ,
                                       :openstack_domain_id => @domain   ,
                                       :openstack_username => @username  ,
                                       :openstack_api_key  => @password  ,
                                       :openstack_project_name   => @project_name
    })


  end
  
  def execute() 
      
    response = compute_client.list_servers
    
    puts response.data.body.servers if @enable_debug_logging
    

    <<-RESULTS
    <results>
      <result name="servers">#{escape(resp.data.body.servers)}</result>
    </results>
    RESULTS

  end

  
  # This is a template method that is used to escape results values (returned in
  # execute) that would cause the XML to be invalid.  This method is not
  # necessary if values do not contain character that have special meaning in
  # XML (&, ", <, and >), however it is a good practice to use it for all return
  # variable results in case the value could include one of those characters in
  # the future.  This method can be copied and reused between handlers.
  def escape(string)
    # Globally replace characters based on the ESCAPE_CHARACTERS constant
    string.to_s.gsub(/[&"><]/) { |special| ESCAPE_CHARACTERS[special] } if string
  end
  # This is a ruby constant that is used by the escape method
  ESCAPE_CHARACTERS = {'&'=>'&amp;', '>'=>'&gt;', '<'=>'&lt;', '"' => '&quot;'}
end
