class Admin::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @members = Member.all
  end
  
end
