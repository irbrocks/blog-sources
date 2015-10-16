#
# Our User model.
#
class User < ActiveRecord::Base
  # ...

  #
  # Check if the current user is just created.
  #
  # == Returns:
  # Boolean
  #
  def just_created?
    created_at == updated_at
  end
end
