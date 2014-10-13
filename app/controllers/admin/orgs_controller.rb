class Admin::OrgsController < AdminController

  def index
    @orgs = Org.all.order(identity_id: :asc, id: :asc)
  end

  def new
    @org = Org.new
    @options = Identity.all.collect do |identity|
      [identity.classification, identity.id]
    end
  end

  def create
    @org = Org.new(org_params)

    if @org.save
      redirect_to admin_orgs_path, :notice => '新增使用單位成功！'
    else
      render :new
    end
  end

  def show
    @org = Org.find(params[:id])
    @members = @org.members
    @records = @org.records.order(start_at: :asc)
  end

  def edit
    @org = Org.find(params[:id])
    @options = Identity.all.collect do |identity|
      [identity.classification, identity.id]
    end
  end

  def update
    @org = Org.find(params[:id])

    if @org.update(org_params)
      redirect_to admin_orgs_path, :notice => '編輯使用單位成功！'
    else
      render :edit
    end
  end

  def destroy
    @org = Org.find(params[:id])

    @org.destroy
    redirect_to admin_orgs_path, :alert => '使用單位已刪除！'
  end


  private

  def org_params
    params.require(:org).permit(:name, 
                                :official_name, 
                                :address, 
                                :tel, 
                                :note,
                                :identity_id)
  end

end
