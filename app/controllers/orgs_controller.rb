class OrgsController < ApplicationController

  def index
    @orgs = Org.all
  end

  def new
    @org = Org.new
  end

  def create
    @org = Org.new(org_params)

    if @org.save
      redirect_to orgs_path, :notice => '新增使用單位成功！'
    else
      render :new
    end
  end

  def show
    @org = Org.find(params[:id])
  end

  def edit
    @org = Org.find(params[:id])
  end

  def update
    @org = Org.find(params[:id])

    if @org.update(org_params)
      redirect_to orgs_path, :notice => '編輯使用單位成功！'
    else
      render :edit
    end
  end


  private

  def org_params
    params.require(:org).permit(:name, :official_name, :address, :tel)
  end

end
