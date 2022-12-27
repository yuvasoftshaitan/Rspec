class ApplicationController < ActionController::Base
	before_action :authenticate_devise_user!
end
