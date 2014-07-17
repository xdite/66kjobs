module OpenGraphable
  extend ActiveSupport::Concern

  include ActionView::Helpers::TextHelper

  def og_description
    content = []
    content << description if description.present?


    str = truncate(content.first, :length => 150 )

    ERB::Util.h(str)
  end

  def company_human_name
    if company_name.present?
      company_name
    else
       "（匿名）"
    end
  end
  
end