class Admin::RecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @records = Record.all
  end
end
