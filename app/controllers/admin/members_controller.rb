class Admin::MembersController < AdminController

  def index
    @members = Member.all.sort_by { |member| [member.org.identity_id, member.org_id] }
  end

  def new
    @member = Member.new
    @options = Org.all.order(identity_id: :asc, id: :asc).collect do |org|
      [org.name, org.id]
    end
    @license_status = ['不具學習資格', '未學習操作', '已學習操作', '已考照', '？']
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
    @options = Org.all.order(identity_id: :asc, id: :asc).collect do |org|
      [org.name, org.id]
    end

    # FIXME: undefined method `name' for #<Identity:0x007fdd5a4c0a38>
    # if @member.org.identity.name != "自行操作"
    #   @license_status = ['不具學習資格']
    # else
      @license_status = ['不具學習資格', '未學習操作', '已學習操作', '已考照', '？']
    # end

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
                                   :sei,
                                   :eds,
                                   :ebsd)
  end
end
