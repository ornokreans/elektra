module ObjectStorage
  module ApplicationHelper

    def make_breadcrumb(container_name, path='')
      # empty path?
      return container_name if path.gsub('/', '') == ''
      # first breadcrumb element is container name, linking to its root directory
      result = link_to(container_name, plugin('object_storage').list_objects_path(container_name))

      # make one crumb per path element
      crumbs = []
      elements = path.split('/').delete_if { |e| e.blank? }
      last_crumb = elements.pop
      elements.each_with_index do |name,idx|
        link = plugin('object_storage').list_objects_path(container_name, path: elements[0..idx].join('/'))
        crumbs << link_to(name, link)
      end
      crumbs << last_crumb

      return result + " > " + crumbs.join('/').html_safe
    end

  end
end
