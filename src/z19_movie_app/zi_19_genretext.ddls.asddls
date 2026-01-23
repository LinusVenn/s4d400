@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'genre text'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_19_GenreText as select from zabap_movie_a
  left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZABAP_GENRE' ) as g on g.value_low = zabap_movie_a.genre
      and g.language = $session.system_language
{
  key zabap_movie_a.movie_uuid as MovieUuid,
  g.text as GenreText
}
