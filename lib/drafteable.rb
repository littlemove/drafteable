require "drafteable/version"

module Drafteable
  def acts_as_drafteable
    include InstanceMethods
  end

  module InstanceMethods

    def published?
      begin
        !self.draft
      rescue NoMethodError
        raise Exception.new('There is no draft field. Did you forget to run migrations?')
      end
    end

    def draft!
      self.update_attribute(:draft, true)
    end

    def publish!
      self.update_attribute(:draft, false)
    end

  end

  ActiveRecord::Base.extend Drafteable
end
