require_dependency "ckpages/application_controller"

module Ckpages
  class Ascendant404Controller < ::ApplicationController
    after_action :set_status_404

    private

      def set_status_404
        # TODO Пока так, пока не найду хорошего способа. Пользователь не всегда хочет
        # чтобы raise exceptions.
        #
        # Памятка. Вырезано с yaponama.
        # Это более не актуально. Необходимо использовать config.exceptions_app ? или
        # wildcard match (*) как это сейчас в ckpages ? Или config.action_dispatch.rescue_responses ?
        # http://www.youtube.com/results?search_query=exception+railscasts
        # rescue_from ActionController::RoutingError, :with => :render_404
        if Module.const_get "ExceptionNotifier"
          ExceptionNotifier.notify_exception(Exception.new("page doesn't exists"), :env => request.env, :data => {:message => "page doesn't exists"})
        end
        response.status = 404
      end
  end
end
