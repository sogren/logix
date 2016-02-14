module LevelsHelper
  def button_triangles(color)
    content_tag :div do
      content_tag(:div, "", class: ["triangle-tl", "#{color[0]}"]) +
      content_tag(:div, "", class: ["triangle-bl", "#{color[0]}"]) +
      content_tag(:div, "", class: ["triangle-tr", "#{color[0]}"]) +
      content_tag(:div, "", class: ["triangle-br", "#{color[0]}"]) +
      color
    end
  end
end
