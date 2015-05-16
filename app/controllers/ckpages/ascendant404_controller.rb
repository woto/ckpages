require_dependency "ckpages/application_controller"

module Ckpages
  class Ascendant404Controller < ::ApplicationController
    after_action :set_status_404

    private

      def set_status_404
        response.status = 404
      end
  end
end
