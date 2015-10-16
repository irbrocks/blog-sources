#
# Our User model.
#
class User < ActiveRecord::Base

  # ...

  before_create :set_just_created

  #
  # Check if the current user is just created.
  #
  # == Returns:
  # Boolean
  #
  def just_created?
    @just_created || false
  end

  private

  #
  # Set a flag indicating this model is just created
  #
  def set_just_created
    @just_created = true
  end
end
