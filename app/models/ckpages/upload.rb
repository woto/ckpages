module Ckpages
  class Upload < ActiveRecord::Base
    mount_uploader :file, Ckpages::ApplicationUploader
  end
end
