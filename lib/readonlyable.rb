module Readonlyable
  extend ActiveSupport::Concern

  def readonly?
    return true
  end

  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end

  module ClassMethods
    def delete(id)
      raise ActiveRecord::ReadOnlyRecord
    end

    def delete_all(conditions)
      raise ActiveRecord::ReadOnlyRecord
    end
  end
end
