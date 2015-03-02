module Expirable
  def self.included(base)
    base.class_eval do
      scope :current, ->(as_at = Time.now) { current_and_expired(as_at).current_and_future(as_at) }

      scope :current_and_future, ->(as_at = Time.now) { where("#{upper_bound_column} IS NULL OR #{upper_bound_column} >= ?", as_at) }
      scope :current_and_expired, ->(as_at = Time.now) { where("#{lower_bound_column} IS NULL OR #{lower_bound_column} <= ?", as_at) }

      class_attribute :lower_bound_method
      class_attribute :upper_bound_method

      def self.current_arel_table
        current_table = current_scope.arel.source.left

        case current_table
        when Arel::Table
          current_table.name
        when Arel::Nodes::TableAlias
          current_table.right
        else
          fail
        end
      end

      def self.lower_bound_field
        lower_bound_method || "effective"
      end
      def self.upper_bound_field
        upper_bound_method || "expire"
      end

      def self.lower_bound_column
        "#{current_arel_table}.#{lower_bound_field}"
      end
      def self.upper_bound_column
        "#{current_arel_table}.#{upper_bound_field}"
      end

      def self.expirable_on(options = {})
        return unless options

        self.lower_bound_method = options[:lower].to_s if options[:lower]
        self.upper_bound_method = options[:upper].to_s if options[:upper]
      end
    end
  end
end
