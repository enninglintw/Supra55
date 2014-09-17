class OrgsController < ApplicationController

  def index
    @orgs = Org.all
  end

end
