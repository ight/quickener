object false

node :reservations do
  partial 'reservations/show', object: @reservations
end

node(:_links) do
  paginate @reservations
end
