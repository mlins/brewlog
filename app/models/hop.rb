# == Schema Information
#
# Table name: hops
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  origin        :string(255)
#  alpha         :decimal(, )
#  beta          :decimal(, )
#  description   :string(255)
#  form          :string(255)
#  hsi           :decimal(, )
#  humulone      :decimal(, )
#  cohumulone    :decimal(, )
#  adhumulone    :decimal(, )
#  lupulone      :decimal(, )
#  colupulone    :decimal(, )
#  adlupulone    :decimal(, )
#  humulene      :decimal(, )
#  myrcene       :decimal(, )
#  caryophyllene :decimal(, )
#  farnese       :decimal(, )
#  notes         :text
#  user_id       :integer
#  master        :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hop < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  FORMS        = %w(Pellet Whole)
  DESCRIPTIONS = %w(Both Bittering Aroma)

  belongs_to :user

  validates_presence_of :name, :alpha, :beta
  validates_uniqueness_of :name, :scope => :user_id

  validates_inclusion_of :description, :in => DESCRIPTIONS
  validates_inclusion_of :form,        :in => FORMS

  validates_numericality_of :alpha, :beta, :hsi, :humulone, :cohumulone,
    :adhumulone, :lupulone, :colupulone, :adlupulone, :humulene, :myrcene,
    :caryophyllene, :farnese, :allow_nil => true

  validates_presence_of :user, :unless => :master?

  scope :masters, where(:master => true)

  def self.countries
    Hop.select("DISTINCT(origin)").where("origin IS NOT NULL").collect { |h| h.origin }.sort
  end
end
