module ActiveAdmin
  module Axlsx
    class Engine < ::Rails::Engine
      engine_name 'active_admin_axlsx'

      initializer 'active_admin.axlsx', :group => :all do |app|
        if Mime::Type.lookup_by_extension(:xlsx).nil?
          Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx
        end

        ActiveAdmin::Views::PaginatedCollection.add_format :xlsx

        ActiveAdmin::ResourceDSL.send :include, ActiveAdmin::Axlsx::DSL
        ActiveAdmin::Resource.send :include, ActiveAdmin::Axlsx::ResourceExtension
        ActiveAdmin::ResourceController.prepend ActiveAdmin::Axlsx::ResourceControllerExtension
      end
    end
  end
end
