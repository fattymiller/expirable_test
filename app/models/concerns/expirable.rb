module Expirable
  def self.included(base)
    base.class_eval do
      scope :current, ->(as_at = Time.now) { current_and_expired(as_at).current_and_future(as_at) }

      scope :current_and_future, ->(as_at = Time.now) { where("#{upper_bound_column} IS NULL OR #{upper_bound_column} >= ?", as_at) }
      scope :current_and_expired, ->(as_at = Time.now) { where("#{lower_bound_column} IS NULL OR #{lower_bound_column} <= ?", as_at) }
      
      class_attribute :lower_bound_method
      class_attribute :upper_bound_method
      
      def self.lower_bound_field
        lower_bound_method || "effective"
      end
      def self.upper_bound_field
        upper_bound_method || "expire"
      end
      
      def self.lower_bound_column
        "#{self.table_name}.#{lower_bound_field}"
      end
      def self.upper_bound_column
        "#{self.table_name}.#{upper_bound_field}"
      end
      
      def self.expirable_on(options = {})
        return unless options
        
        self.lower_bound_method = options[:lower].to_s if options[:lower]
        self.upper_bound_method = options[:upper].to_s if options[:upper]
      end
    end
  end
end