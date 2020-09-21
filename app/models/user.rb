class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, PictureUploader
  belongs_to :curso, optional: true
  has_many :anotaciones
  has_many :materias
  #Validaciones

  validates :nombre, :apellido, :telefono, :direccion, :email, :password, presence: true
  validates :telefono,numericality: { only_integer: true }
  validates :email, uniqueness: true
  # Roles con rolify

  #attr_accessible :role_ids

  # accepts_nested_attributes_for
  accepts_nested_attributes_for :curso
end
