class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :member

  after_create :find_and_bind_member
  after_update :update_user_and_member


  def admin?
    is_admin
  end


  protected

  def find_and_bind_member
    exists_member = Member.find_by(name: name)

    if exists_member.present?
      exists_member.update(email: email, user_id: id)
    else
      Member.create(name: name, email: email, user_id: id, org_id: 13, identity_id: 6)
    end
  end

  def update_user_and_member
    exists_member = Member.find_by(name: name)
    exists_member.update(email: email, user_id: id)
  end

end
