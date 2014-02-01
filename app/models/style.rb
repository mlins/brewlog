# == Schema Information
#
# Table name: styles
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  category        :string(255)
#  category_number :string(255)
#  style_letter    :string(255)
#  style_guide     :string(255)
#  description     :string(255)
#  og_min          :decimal(, )
#  og_max          :decimal(, )
#  fg_min          :decimal(, )
#  fg_max          :decimal(, )
#  ibu_min         :decimal(, )
#  ibu_max         :decimal(, )
#  color_min       :decimal(, )
#  color_max       :decimal(, )
#  carb_min        :decimal(, )
#  carb_max        :decimal(, )
#  abv_min         :decimal(, )
#  abv_max         :decimal(, )
#  notes           :text
#  profile         :text
#  ingredients     :text
#  examples        :text
#  master          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Style < ActiveRecord::Base

  DESCRIPTIONS = %w(Lager Ale Mead Wheat Mixed Cider)

  belongs_to :user

  validates_presence_of :abv_max, :abv_min, :carb_max, :carb_min,
    :color_max, :color_min, :fg_max, :fg_min, :ibu_max, :ibu_min,
    :name, :og_max, :og_min

  validates_inclusion_of :description,  in: DESCRIPTIONS

  validates_presence_of :user, unless: :master?

  scope :masters, where(master: true)
end
