object false
collection @tables, object_root: false

node :tables do
  partial 'tables/show', object: @tables
end

node(:_links) do
  paginate @tables
end
