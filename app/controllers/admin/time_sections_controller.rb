class Admin::TimeSectionsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @time_sections = TimeSection.all.order(start_at: :asc)
  end

end
