class UserCreator

  MASTERS = {
    Hop         => :hops,
    Fermentable => :fermentables,
    Yeast       => :yeasts,
    Style       => :styles
  }

  def initialize(user, masters=MASTERS)
    @user    = user
    @masters = masters
  end

  def create
    @user.save && build_associations
  end

  private

  def build_associations
    @masters.each do |klass, association|
      klass.masters.each do |master|
        @user.send(association) << master.dup
      end
    end
  end
end
