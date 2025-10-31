using { anubhav.db.movies } from '../db/datamodel';


service CatalogService @(path: 'CatalogService', requires: 'authenticated-user') {
  //demo
  
  entity MoviesSet @(restrict: [
    {
      grant: ['READ'],
      to: 'viewer',
      where: 'country = $user.mycountry'
    },
    {
      grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'],
      to: 'editor'
    }
  ]) as projection on movies;
  
}
