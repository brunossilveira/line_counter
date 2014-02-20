module IssuePatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)


    # Exectue this code at the class level (not instance level)
    base.class_eval do
      has_many :branches
    end
  end

  module ClassMethods
  end
  module InstanceMethods
  end
end