using { authorbook.db as db } from '../db/schema';

service CatalogService @(path:'/catalog') {
  // drafts only on main entitt 
  @odata.draft.enabled
  entity Authors as projection on db.Authors;

  // never define drafts for child entity
  entity Books as projection on db.Books;
}
