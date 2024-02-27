class ApplicationController < ActionController::Base
    include Pagy::Backend
    add_flash_types :success , :danger , :warning, :info 
    before_action :set_locale

    def set_locale 
        I18n.locale = cookies[:locale] || I18n.default_locale
    end
end
