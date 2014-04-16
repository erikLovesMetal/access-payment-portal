class HomeownerController < ApplicationController
	before_filter :authenticate_admin!

	def getHomeowners()
		@owners  = User.all().limit(25)
		render '/homeowner/index'
	end

	def resource
    @resource ||= Admin.new
  end
end
