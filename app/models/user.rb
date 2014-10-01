class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :member

  validates :org_id, :presence => true

  after_create :find_and_bind_member
  after_update :update_user_and_member


  protected

  def find_and_bind_member
    exists_member = Member.find_by(name: name)

    if exists_member.present?
      exists_member.update(email: email, user_id: id)
    else
      Member.create(name: name, email: email, user_id: id)
    end
  end

  def update_user_and_member
    exists_member = Member.find_by(name: name)
    exists_member.update(email: email, user_id: id)
  end

  # @o_options = Org.all.collect do |org|
  #   [org.name, org.id]
  # end

  # @i_options = Identity.all.collect do |identity|
  #   [identity.classification, identity.id]
  # end

end
