# == Schema Information
#
# Table name: yeasts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  laboratory      :string(255)
#  description     :string(255)
#  form            :string(255)
#  product_id      :string(255)
#  min_temperature :decimal(, )
#  max_temperature :decimal(, )
#  min_attenuation :decimal(, )
#  max_attenuation :decimal(, )
#  flocculation    :string(255)
#  master          :boolean          default(FALSE)
#  notes           :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Yeast < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  FORMS = %w(Liquid Dry Slant Culture)
  DESCRIPTIONS = %w(Ale Lager Wheat Wine Champagne)
  FLOCCULATIONS = ['Low', 'Medium', 'High', 'Very High']

  belongs_to :user

  validates_presence_of :name, :min_attenuation, :max_attenuation

  validates_inclusion_of :description,  in: DESCRIPTIONS
  validates_inclusion_of :form,         in: FORMS
  validates_inclusion_of :flocculation, in: FLOCCULATIONS 

  validates_presence_of :user, unless: :master?

  scope :masters, where(master: true)

  def self.laboratories
    Yeast.select("DISTINCT(laboratory)").where("laboratory IS NOT NULL").collect { |f| f.laboratory }.sort
  end
end
