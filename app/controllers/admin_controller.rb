class AdminController < ApplicationController
	before_filter :authenticate_admin!

	def index
		@users = User.all()
		@user_count = User.all().count()
		@lastParse = Parse.last()
		render 'admin/index'
	end

  def resource
    @resource ||= Admin.new
  end

end
