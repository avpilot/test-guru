module SessionsHelper
  def show_flash
    flash.map do |type, msg|
      case type
      when 'alert' then content_tag :p, msg, class: 'flash alert'
      else content_tag :p, msg, class: 'flash notice'
      end
    end.join.html_safe
  end
end
