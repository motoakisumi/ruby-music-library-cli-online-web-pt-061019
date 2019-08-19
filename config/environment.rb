require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|song|song.name == name}
    end

    def find_or_create_by_name(name)
      result = self.find_by_name(name)
      if result != nil
        result
      else
        self.create(name)
      end
    end
  end
end


require_all 'lib'
