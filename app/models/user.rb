class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :member

  after_create :find_and_bind_member

  def admin?
    is_admin
  end


  protected

  def find_and_bind_member
    exists_member = Member.find_by(name: name)

    if exists_member.present?
      exists_member.update(user_id: id)
    else
      Member.create(name: name, user_id: id)
    end
  end

end
