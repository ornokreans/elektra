module Compute
  module Flavors
    class MembersController < Image::ApplicationController

      def index
        @flavor = services_ng.compute.find_flavor(params[:flavor_id])
        @members = services_ng.compute.flavor_members(params[:flavor_id])
      end

      def create
        @member = services_ng.compute.new_flavor_access(params[:member])
        @member.flavor_id = params[:flavor_id]

        # validate if we are allowed to :)
        if current_user.is_allowed?('identity:project_get')
          @project = services_ng.identity.find_project(@member.tenant_id.strip)
          if @project.nil?
            @member.errors.add(:project, "Could not find project #{@member.tenant_id}")
            return
          end
        end
        @member.save
      end

      def destroy
        member = services_ng.compute.new_flavor_access
        member.flavor_id = params[:flavor_id]
        member.tenant_id = params[:id]
        @success = member.destroy
      end

    end
  end
end
