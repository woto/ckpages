module Ckpages
  module ApplicationHelper

    def ckpart title, options = {}, locals = {}, &block
      @part = Ckpages::Part.find_by!(title: title)
      options = options.merge(partial: 'ckpart')
      render options, locals, &block
    end

    def dt_dd(page, attr, lmbd=nil)
      if page.send("#{attr}?")
        content_tag(:dt) do
          Page.human_attribute_name(attr)
        end +
        content_tag(:dd) do
          val = page.send("#{attr}")
          if lmbd.nil?
            val.to_s
          else
            lmbd.call(val)
          end
        end
      end
    end

  end
end
