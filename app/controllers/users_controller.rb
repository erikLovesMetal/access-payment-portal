class UsersController < ApplicationController
  before_action :authenticate_user!

	def show
    # @userProfile = User.find(params[:id])
    puts current_user.inspect
    @user = current_user
    puts "users show"

    # @title = @userProfile.name
  end

  # TODO MOVE THIS....
  # http://pupeno.com/2010/08/29/show-a-devise-log-in-form-in-another-page/
  def resource
    @resource ||= User.new
  end
end
