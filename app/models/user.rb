class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :professeur, :principale, :censeur, :proviseur], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates_presence_of :name
   
   #belongs_to :privilege
   has_many :comments, dependent: :destroy
   has_many :blogs, dependent: :destroy
   has_many :authors, dependent: :destroy
  def first_name
  	self.name.split.first
  end

  def last_name
  	self.name.split.last
  end

  def set_to_profil(profil)
    self.update!(roles:profil)
  end
end
