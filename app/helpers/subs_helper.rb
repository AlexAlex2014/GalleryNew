# frozen_string_literal: true

# module SubsHelper
module SubsHelper
  def find_user_sub(subable_id, subable_type)
    Sub.find_by(subable_id: subable_id,
                subable_type: subable_type, user_id: current_user.id)
  end
end
