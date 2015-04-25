module Ckpages
  class Page < ActiveRecord::Base
    after_validation :normalize

    validates :path, presence: true, uniqueness: {case_sensitive: false}
    validates :redirect_url, format: { with: /\A\/|http:\/\/|https:\/\// }, allow_nil: true, allow_blank: true

    def normalize
      return false unless self.errors.empty?

      self.path = self.path.gsub(/\A\/+/, '')
      self.path = self.path.gsub(/\/+\z/, '')
      self.path = self.path.gsub(/\A\s+/, '')
      self.path = self.path.gsub(/\s+\z/, '')

      if self.path.length <= 0
        errors.add(:path, :empty)
        return false
      end
    end

  end
end
