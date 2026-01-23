@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_19_MovieTP
  provider contract transactional_query as projection on ZR_19_MovieTP
{
  key MovieUuid,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Title,
  
  @ObjectModel.text.element: ['GenreText']
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_10_GenreVH', element: 'Genre'} }]
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  
  //Transient Data
  AverageRating,
  AverageRatingCriticality,
  GenreText,
  
  
  _Ratings: redirected to composition child ZC_19_RatingTP
  
  
  
  
  
}
