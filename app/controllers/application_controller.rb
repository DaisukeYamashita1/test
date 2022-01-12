class ApplicationController < ActionController::Base

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500(e = nil)
    # render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
    logger.error "Rendering 500 with exception: #{e.message}" 
    # Airbrake.notify(e) if e # Airbrake/Errbitを使う場合はこちら
  end

end
