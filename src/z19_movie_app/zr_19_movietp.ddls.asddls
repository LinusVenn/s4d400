@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

define root view entity ZR_19_MovieTP
  as select from ZI_19_Movie

  association [0..1] to ZI_19_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [0..1] to ZI_19_GenreText     as _GenreText     on $projection.MovieUuid = _GenreText.MovieUuid

  composition [0..*] of ZR_19_RatingTP      as _Ratings

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,

      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      _AverageRating.AverageRating            as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality,

      _GenreText.GenreText as GenreText,
      _Ratings
}
