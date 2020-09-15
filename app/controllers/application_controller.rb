class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = "Acceso denegado."
      redirect_to(request.referrer || root_path)
  end
  # add_flash_types :danger,:info,:warning,:success


end
