require 'multi_xml'

module Faraday
  class Response::ParseXml < Response::Middleware
    def self.register_on_complete(env)
      env[:response].on_complete do |response|
        response[:body] = begin
          MultiXml.parse(response[:body])
        end
      end
    end

    def initialize(app)
      super
      @parser = nil
    end
  end
end
