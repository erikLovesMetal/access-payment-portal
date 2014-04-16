class PublicController < ApplicationController

	def public_index
		render '/public/index'
	end

	def resource
    @resource ||= User.new
  end
end
