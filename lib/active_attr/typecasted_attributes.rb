require "active_attr/attributes"
require "active_attr/typecasting"
require "active_support/concern"

module ActiveAttr
  # TypecastedAttributes enhances attribute handling with typecasting
  #
  # @example Usage
  #   class Person
  #     include ActiveAttr::TypecastedAttributes
  #     attribute :name
  #     attribute :age, :type => Integer
  #   end
  #
  #   person = Person.new
  #   person.name = "Ben Poweski"
  #   person.age  = "29"
  #
  #   person.age #=> 29
  #
  # @since 0.5.0
  module TypecastedAttributes
    extend ActiveSupport::Concern
    include Attributes
    include Typecasting

    private

    # Reads the attribute and typecasts the result
    #
    # @since 0.5.0
    def attribute(name)
      typecast_attribute(self.class.attributes[name].type, super)
    end
  end
end