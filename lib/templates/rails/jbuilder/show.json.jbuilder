json.extract! @<%= singular_table_name %>,<%- if not attributes.include?("name") -%><%= " :name," -%><%- end -%> <%= attributes_list_with_timestamps %>

