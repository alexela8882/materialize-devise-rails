module EmailPlansHelper
	def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "arrow_upward" : "arrow_downward"
    icon = column == sort_column ? icon : "swap_vert"
    link_to "#{title} <span class='material-icons'>#{icon}</span>".html_safe, {column: column, direction: direction}
  end
end