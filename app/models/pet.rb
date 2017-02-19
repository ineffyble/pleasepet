class Pet < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :page, dependent: :destroy, autosave: true
  has_many :received_pettings, class_name: 'Petting', foreign_key: 'petted_id'
  has_many :performed_pettings, class_name: 'Petting', foreign_key: 'petter_id'

  accepts_nested_attributes_for :page
end
