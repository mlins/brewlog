# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :hops
  has_many :fermentables
  has_many :yeasts

  has_many :styles

  after_create :create_hops, :create_fermentables, :create_yeasts,
    :create_styles

  private

  def create_hops
    Hop.masters.each do |master|
      hop = hops.build(
        master.attributes.keep_if do |k,v|
          !%w(id master user_id).include?(k)
        end
      )
      hop.save
    end
  end

  def create_fermentables
    Fermentable.masters.each do |master|
      fermentable = fermentables.build(
        master.attributes.keep_if do |k,v|
          !%w(id master user_id).include?(k)
        end
      )
      fermentable.save
    end
  end

  def create_yeasts
    Yeast.masters.each do |master|
      yeast = yeasts.build(
        master.attributes.keep_if do |k,v|
          !%w(id master user_id).include?(k)
        end
      )
      yeast.save
    end
  end

  def create_styles
    Style.masters.each do |master|
      style = styles.build(
        master.attributes.keep_if do |k,v|
          !%w(id master user_id).include?(k)
        end
      )
      style.save
    end
  end
end
