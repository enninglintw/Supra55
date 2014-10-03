class Account::RecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_org

  def index
    @records = @org.records.order(start_at: :asc)
  end


  private

  def find_org
    @org = Org.find_by(id: current_user.member.org_id)
  end

end
