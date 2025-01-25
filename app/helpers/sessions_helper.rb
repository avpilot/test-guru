module SessionsHelper
  def show_flash(flash)
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
