@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_19_TravelTP
  as select from ZI_19_Travel
  
  association [1..1] to ZI_19_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId

  composition [0..*] of ZR_19_BookingTP as _Bookings

{
  key TravelId,

      AgencyId,
      
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,


      BookingFee,


      TotalPrice,

      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data: existiert nur zur Laufzeit */
      case Status when 'X' then 1
                  when 'P' then 2
                  when 'B' then 3
                  else 0 end as StatusCriticality,
                  
      _CustomerText.CustomerName as CustomerName,


      // Associations
      _Bookings
}
