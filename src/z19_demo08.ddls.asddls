@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 6: Outer Joins'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z19_DEMO08
  as select from /dmo/connection

  association [1..1] to /dmo/carrier as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights
    on  _Flights.carrier_id    = $projection.CarrierId
    and _Flights.connection_id = $projection.ConnectionId

{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,

      /*Associations */
      _Carrier,
      _Flights
}

where carrier_id    = 'LH'
  and connection_id = '0400'
