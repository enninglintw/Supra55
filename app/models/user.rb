class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :member

  after_create :find_and_bind_member

  protected

  def find_and_bind_member
    exists_member = Member.find_by(name: name)

    if exists_member.present?
      exists_member.update(email: email, user_id: id)
    else
      # FIXME: org_id = 1
      Member.create(name: name, email: email, user_id: id, org_id: 1)
    end
  end

end