class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  layout 'admin'
end
