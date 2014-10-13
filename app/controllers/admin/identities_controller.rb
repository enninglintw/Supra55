class Admin::IdentitiesController < AdminController

  def index
    @identities = Identity.all
  end

  def new
    @identity = Identity.new
  end

  def create
    @identity = Identity.new(identity_params)

    if @identity.save
      redirect_to admin_identities_path, :notice => '新增收費標準成功！'
    else
      render :new
    end
  end

  def show
    @identity = Identity.find(params[:id])
    @orgs = @identity.orgs
  end

  def edit
    @identity = Identity.find(params[:id])
  end

  def update
    @identity = Identity.find(params[:id])

    if @identity.update(identity_params)
      redirect_to admin_identities_path, :notice => '編輯收費標準成功！'
    else
      render :edit
    end
  end

  def destroy
    @identity = Identity.find(params[:id])

    @identity.destroy
    redirect_to admin_identities_path, :alert => '收費標準已刪除！'
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
