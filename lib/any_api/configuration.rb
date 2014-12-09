module AnyApi
  class Configuration
    attr_accessor :username, :password, :api_base_url, :log_level

    def initialize
      self.username =  nil
      self.password =  nil
      self.api_base_url = nil
      self.log_level = 'info'
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

end
