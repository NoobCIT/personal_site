class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ArticlesHelper
  include CommentsHelper
  include UsersHelper
  include SessionsHelper
  include StaticPagesHelper
end
