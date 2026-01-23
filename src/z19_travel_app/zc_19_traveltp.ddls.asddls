@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Search.searchable: true

@Metadata.allowExtensions: true
define root view entity ZC_19_TravelTP
  provider contract transactional_query
  as projection on ZR_19_TravelTP 

{
  key TravelId,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyID'} }]
      AgencyId,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_19_CustomerVH', element: 'CustomerId'} }]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencySTDVH', element: 'Currency'} }]
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      
      /*Transient Data */
      StatusCriticality,
      CustomerName,
      
       _Bookings: redirected to composition child ZC_19_BookingTP 
    
}
