object @reservation

attributes :id, :guest_count

node :reseravtion_on do |reservation|
  reservation.reservation_time.ctime
end

node :reserved_by do |reservation|
  reservation.guest.name
end

node :restourant do |reservation|
  reservation.restourant.name
end