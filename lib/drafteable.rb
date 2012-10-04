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
      self.draft = true
      self.save(validation: false)
    end

    def publish!
      self.draft = false
      self.save
    end

  end

  ActiveRecord::Base.extend Drafteable
end
