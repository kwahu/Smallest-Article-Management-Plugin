

module ArticleImagesHelper

  # Used in the Page Form to build an indented drop-down list of pages
  def category_tree_select_box(nodes, selected= nil, hide= nil, label="Parent", add_initial=false)
    level = 0
    select_box = add_initial ? "<option value=0>No #{label}</option>\n" : ""
    selected = nodes[0].id if selected.nil? and not add_initial
    nodes.each {|node| select_box += add_category_select_tree_node(node, selected, level, hide) }
    select_box += ''
  end
  # Called by tree_select_box
  def add_category_select_tree_node(node, selected, level, hide)
    #return '' if node.is_system_page? and !current_user.is_master_admin?
  
    padding = "&nbsp;" * level * 4
    padding += '&raquo; ' unless level==0
    hide_values = Array.new
    hide_values << hide if hide
    if node.id == selected
      select_box = %Q|<option value="#{node.id}" selected>#{padding}#{node.name}</option>\n|
    else
      if hide_values.include?(node.id)
        select_box = ''
      else
        select_box = %Q|<option value="#{node.id}">#{padding}#{node.name}</option>\n|
      end
    end
    node.children.each do |child|
      select_box += add_category_select_tree_node(child, selected, level + 1, hide) unless hide_values.include?(node.id)
    end
    select_box
  end
  
end
