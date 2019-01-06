class ReservationRestourantMailer < ApplicationMailer
  def confirmation(action, reservation)
    @reservation = reservation
    @guest = @reservation.guest
    @restourant = @reservation.restourant
    @app = QuickenerSettings.application_name
    @table = @reservation.table
    @shift = @reservation.shift
    subject = _("mailers.reservation_restourant_mailer.#{action}.subject", guest_name: @guest.name.to_s,
                                                              app_name: @app)
    mail(to: @restourant.email, subject: subject)
  end
end
