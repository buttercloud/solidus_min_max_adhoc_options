module SolidusMinMaxAdhocOptions
  class Engine < Rails::Engine
    require 'spree/core'

    isolate_namespace Spree
    engine_name 'solidus_min_max_adhoc_options'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        require_dependency(c)
      end
    end

    initializer "spree.permit_stock_item_flags" do |c|
      Spree::PermittedAttributes.stock_item_attributes.push(:not_available)
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
