@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define view entity ZI_19_Travel
  as select from /dmo/travel

{
  key travel_id     as TravelId,

      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      booking_fee   as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,

    //  @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_code as CurrencyCode,

      description   as Description,
      status        as Status,
      
      @Semantics.user.createdBy: true
      createdby     as CreatedBy,
      
      @Semantics.systemDateTime.createdAt: true
      createdat     as CreatedAt,
      
      @Semantics.user.lastChangedBy: true
      lastchangedby as LastChangedBy,
      
       @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat as LastChangedAt
}
