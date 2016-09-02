class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_current_user_activities

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  include PublicActivity::StoreController

  # Uncomment when you *get* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :job_title, :photo, :run_level])
  end

   def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || events_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /^(active_)?admin/
  end

  def set_current_user_activities
    if user_signed_in?
      event_ids = current_user.events_as_participant.map do |event|
        event.id
      end
      @activities = PublicActivity::Activity.order("created_at desc").where(trackable_id: event_ids, read_at: nil)
    else
      @activities = []
    end
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

end
