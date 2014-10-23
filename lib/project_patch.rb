module ProjectPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    # Exectue this code at the class level (not instance level)
    base.class_eval do
      has_many :correction_factors      
    end
  end

  module InstanceMethods
    def update_correction_factors(correction_factors)      
      correction_factors.each do |c|
        unless c[:value].nil?
          correction_factor = self.correction_factors.where(:tracker_id => c[:tracker_id], :complexity => c[:complexity]).first
          if correction_factor.nil?
            correction_factor = CorrectionFactor.new
            correction_factor.project = self
            correction_factor.value = c[:value]
            correction_factor.tracker_id = c[:tracker_id]        
            correction_factor.complexity = c[:complexity]
            correction_factor.save
            self.correction_factors << correction_factor
          else
            correction_factor.value = c[:value]
            correction_factor.save!
          end
        end
      end
    end

  end
end