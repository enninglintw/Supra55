class Admin::MembersController < AdminController

  def index
    @members = Member.all.sort_by { |member| [member.org.identity_id, member.org_id] }
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      redirect_to admin_members_path, :notice => '新增使用者成功！'
    else
      render :new
    end
  end

  def show
    @member = Member.find(params[:id])
    @records = @member.records
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to admin_members_path, :notice => '編輯使用者成功！'
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])

    @member.destroy
    redirect_to admin_members_path, :alert => '使用者已刪除！'
  end


  private

  def member_params
    params.require(:member).permit(:name,
                                   :tel,
                                   :email,
                                   :org_id,
                                   :user_id,
                                   :sei_bei_license,
                                   :eds_license,
                                   :ebsd_license)
  end
end
