module Ckpages
  class Page < ActiveRecord::Base
    before_validation :normalize
    validates :path, uniqueness: {case_sensitive: false}
    validates :redirect_url, format: { with: /\A\/|http:\/\/|https:\/\// }, allow_nil: true, allow_blank: true

    def normalize
      self.path = self.path.gsub(/\A\/+/, '')
      self.path = self.path.gsub(/\/+\z/, '')
      self.path = self.path.gsub(/\A\s+/, '')
      self.path = self.path.gsub(/\s+\z/, '')
      self.path = '/' + self.path

    end

  end
end
