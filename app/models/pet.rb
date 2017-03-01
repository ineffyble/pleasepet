class Pet < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :page, dependent: :destroy, autosave: true
  has_many :received_pettings, class_name: 'PetInteraction', foreign_key: 'petted_id', dependent: :destroy
  has_many :performed_pettings, class_name: 'PetInteraction', foreign_key: 'petter_id', dependent: :destroy

  accepts_nested_attributes_for :page

  delegate :url, :to => :page, :prefix => true

end
