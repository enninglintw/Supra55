class Admin::IdentitiesController < ApplicationController
  def index
    @identities = Identity.all
  end
end
