module Masterable
  extend ActiveSupport::Concern

  included do
    scope :masters, -> { where(master: true) }
  end

  def dup
    super.tap do |object|
      object.master = false
      object.user_id = nil
    end
  end
end
