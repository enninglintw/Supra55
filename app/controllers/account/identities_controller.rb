class Account::IdentitiesController < ApplicationController

  before_action :authenticate_user!

  def show
    @identity = Identity.find(params[:id])
  end
  
end
