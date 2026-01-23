@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'

define view entity ZR_19_RatingTP as select from ZI_19_Rating
association to parent ZR_19_MovieTP as _Movie
  on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  _Movie // Make association public
}
