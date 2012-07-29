#coding: utf-8
module ApplicationHelper
  def page_title(text="雪花街|账号")
    content_for(:title) {text.to_s}
  end
end
