class Admin::IdentitiesController < ApplicationController

  def index
    @identities = Identity.all
  end

  def new
    @identity = Identity.new
  end

  def create
    @identity = Identity.new(identity_params)

    if @identity.save
      redirect_to admin_identities_path, :notice => '新增分類成功！'
    else
      render :new
    end
  end


  private

  def identity_params
    params.require(:identity).permit(:classification, 
                                     :sei_fee, 
                                     :sei_eds_fee, 
                                     :sei_ebsd_fee, 
                                     :sei_eds_ebsd_fee, 
                                     :discount_above_30k, 
                                     :discount_above_40k, 
                                     :discount_above_60k)
  end
end
