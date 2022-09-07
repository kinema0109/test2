class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
    def hello
        render html:" el mundo"
    end
    def show
      @user= User.find(params[:id])
    end 
    def new
      @user=User.new
    end 
    def create
      @user=User.new(user_params)
      if @user.save
      else 
        render 'new'
      end
    end
    def default_url_options
      {locale: I18n.locale}
    end
    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end
    def extract_locale
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale)?
      parsed_locale.to_sym : nil
    end
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
