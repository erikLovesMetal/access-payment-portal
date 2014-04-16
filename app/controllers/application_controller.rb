class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :authenticate_by_resource
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
  	# if admin logged in then go to admin dash
  	# else go to user page
  	# puts current_admin
  	if current_admin
  		admin_path
  	elsif current_user
  		# TODO ! this is temp, prob want to go to users profile page when it s created
  		# root_path
  		# puts current_user.inspect
  		# user_path(@current_user.id)
  		user_path(current_user)
  	end
	end

	# TODO : FINISH THIS
	def after_sign_out_path_for(resource)
    puts "below here"
    if resource == :admin
      puts "admin"
      destroy_admin_session_path
    else
      puts "client"
      destroy_user_session_path
    end
  	# user_path(	current_user) #your path
		# admin_login
	end

	protected

	# diff layouts for user and admin
	def layout_by_resource
	  if resource.class == User
	    "users"
	  else
	    "application"
	  end
	end

	# IDEA do same idea as above but with :authenticate_user! / :authenticate_admin!
	# and tie into before_action
  protected

  def authenticate_by_resource
    # puts self.class
    # if self.class == 'AdminController'
    #   :authenticate_admin!
    # else
    #   :authenticate_user!
    # end

    if current_admin != nil
     authenticate_admin!
    else
     authenticate_user! :except => [:public_index]
    end

  end

end
