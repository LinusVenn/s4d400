@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'ABAP-CDS-05'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z19_CustomerKPIs
  with parameters
    p_city : abap.char(40)

  as select from Z19_Travel_With_Customer

{
  key CustomerID                                     as CustomerId,

      CustomerName                                   as CustomerName,
      Street                                         as Street,
      PostalCode                                     as PostalCode,
      City                                           as City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(ConvertedPrice) + sum(ConvertedBookingFee) as TotalRevenue,

      CurrencyCode2                                  as CurrencyCode,
      avg(Duration as abap.dec(16,0))                as AverageDuration,
      count(distinct AgencyID)                       as NumberOfDifferentAgencies
}

where City = $parameters.p_city

group by CustomerID,
         CustomerName,
         Street,
         PostalCode,
         City,
         CurrencyCode2

having sum(ConvertedPrice + ConvertedBookingFee) >= 5000
