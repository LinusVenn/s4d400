@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'ABAP-CDS-03'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z19_Travel_With_Customer
  as select from Z19_Travel                       as t

    inner join   Z19_Customer                     as c
      on c.CustomerId = t.CustomerId

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/STATUS') as s

      on  s.value_low = t.Status
      and s.language  = $session.system_language

{
  key t.TravelId                                                                   as TravelID,

      t.AgencyId                                                                   as AgencyID,
      t.BeginDate                                                                  as BeginDate,
      t.EndDate                                                                    as EndDate,

      @EndUserText.quickInfo: 'Duration'
      dats_days_between(t.BeginDate, t.EndDate) + 1                                as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode2'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date)              as ConvertedPrice,

      cast('EUR' as abap.cuky)                                                     as CurrencyCode2,
       @Semantics.amount.currencyCode: 'CurrencyCode3'
      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date)              as ConvertedBookingFee,

      cast('EUR' as abap.cuky)                                                     as CurrencyCode3,
      t.Description                                                                as Description,
      t.Status                                                                     as Status,

      c.CustomerId                                                                 as CustomerID,
      concat_with_space(concat_with_space(c.Title, c.FirstName, 1), c.LastName, 1) as CustomerName,
      c.Street                                                                     as Street,
      c.PostalCode                                                                 as PostalCode,
      c.City                                                                       as City
}

where c.CountryCode = 'DE'
