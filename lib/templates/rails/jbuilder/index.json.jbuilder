# rvm path

json.array!(@<%= plural_table_name %>) do |<%= singular_table_name %>|
  json.extract! <%= singular_table_name %>, <%- if not attributes.include?("name") -%><%= ":name, " -%><%- end %><%= attributes_list %>
  json.url <%= singular_table_name %>_url(<%= singular_table_name %>, format: :json)
end
