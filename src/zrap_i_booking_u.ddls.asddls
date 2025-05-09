@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking details'

define view entity ZRAP_I_BOOKING_U
  as select from /dmo/booking as Booking

  association        to parent ZRAP_I_TRAVEL_U as Travel     on  $projection.TravelId = Travel.TravelId

  association [1..1] to /DMO/I_Customer        as customer   on  $projection.CustomerId = customer.CustomerID
  association [1..1] to /DMO/I_Carrier         as carrier    on  $projection.CarrierId = carrier.AirlineID
  association [1..1] to /DMO/I_Connection      as connection on  $projection.CarrierId    = connection.AirlineID
                                                             and $projection.ConnectionId = connection.ConnectionID
  //  association [1..1] to /DMO/I_Booking_Status_VH as status     on  $projection.BookingStatus = status.BookingStatus
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      //      booking_status  as BookingStatus,
      //      last_changed_at as LastChangedAt,

      //Associations
      Travel,
      customer,
      carrier,
      connection
      //      status
}
