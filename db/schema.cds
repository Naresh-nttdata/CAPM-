namespace authorbook.db;
using { cuid, managed } from '@sap/cds/common';


entity Authors : cuid, managed {
    name : String(100) @mandatory;
    biography : String(500);
    books : Composition of many Books on books.author = $self;
    //books : Association to many Books on books.author = $self;
}
entity Books : cuid, managed {
    title : String(200) @mandatory;
    price : Decimal(10, 2) @mandatory;
    stock : Integer default 0 @mandatory;
    author : Association to Authors @mandatory;
}
