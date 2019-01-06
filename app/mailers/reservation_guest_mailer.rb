class ReservationGuestMailer < ApplicationMailer
  def confirmation(action, reservation)
    @reservation = reservation
    @guest = @reservation.guest
    @restourant = @reservation.restourant
    @app = QuickenerSettings.application_name
    @table = @reservation.table
    @shift = @reservation.shift
    subject = _("mailers.reservation_guest_mailer.#{action}.subject", restourant_name: @restourant.name.to_s,
                                                              app_name: @app)
    mail(to: @guest.email, subject: subject)
  end
end
