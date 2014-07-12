class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html  {
          redirect_to root_path
        }
        format.js{
          render :partial => "common/not_logined"
        }
        format.all {
          head(:unauthorized)
        }
      end
    end

  end


  def require_is_admin
    unless (current_user && current_user.admin?)
      redirect_to root_path, :flash => { :error => "no permission" }
    end
  end
  
end
