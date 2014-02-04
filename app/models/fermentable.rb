# == Schema Information
#
# Table name: fermentables
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  origin                 :string(255)
#  supplier               :string(255)
#  description            :string(255)
#  max_in_batch           :decimal(, )
#  potential              :decimal(, )
#  yield                  :decimal(, )
#  coarse_fine_difference :decimal(, )
#  moisture               :decimal(, )
#  diastatic_power        :decimal(, )
#  protein                :decimal(, )
#  ibu                    :decimal(, )
#  color                  :decimal(, )
#  recommended_mash       :boolean          default(FALSE)
#  add_after_boil         :boolean          default(FALSE)
#  notes                  :text
#  master                 :boolean          default(FALSE)
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Fermentable < ActiveRecord::Base

  include Masterable

  DESCRIPTIONS = ["Grain", "Sugar", "Extract", "Dry Extract", "Adjunct"]

  belongs_to :user

  validates_presence_of :name, :max_in_batch, :color, :potential,
    :yield

  validates_presence_of :coarse_fine_difference, :moisture, :diastatic_power,
    :protein, if: :grain?

  validates_presence_of :ibu, if: :extract?

  validates_inclusion_of :description, in: DESCRIPTIONS

  validates_numericality_of :max_in_batch, :potential, :yield,
    :coarse_fine_difference, :moisture, :diastatic_power, :protein,
    :protein, :ibu, :color, allow_nil: true

  validates_presence_of :user, unless: :master?

  def self.countries
    Fermentable.select("DISTINCT(origin)").where("origin IS NOT NULL").collect { |f| f.origin }.sort
  end

  def self.suppliers
    Fermentable.select("DISTINCT(supplier)").where("supplier IS NOT NULL").collect { |f| f.supplier }.sort
  end

  DESCRIPTIONS.each do |description|
    define_method "#{description.downcase.gsub(' ', '_')}?" do
      description == self[:description]
    end
  end
end
