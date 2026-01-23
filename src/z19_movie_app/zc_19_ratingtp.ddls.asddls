@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking'

@Metadata.allowExtensions: true

define view entity ZC_19_RatingTP
  as projection on ZR_19_RatingTP

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      _Movie : redirected to parent ZC_19_MovieTP
}
