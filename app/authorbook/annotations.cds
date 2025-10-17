using CatalogService as service from '../../srv/cat-service';

annotate service.Authors with @(
    UI.HeaderInfo: {
        Title: { Value: name },
        Description: { Value: biography }
    },
    UI.LineItem: [
        { Value: name, Label: 'Name' },
        { Value: biography, Label: 'Biography' }
    ],
    UI.Facets: [//sections for object page
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'BooksFacet',
            Label: 'Books',
            Target: 'books/@UI.LineItem'//linked to below book entity
        }
    ]
);


annotate service.Books with @(
    UI.CreateHidden: false,
    UI.DeleteHidden: false,
    UI.HeaderInfo: {
        Title: { Value: title },
        Description: { Value: author.name }
    },
    UI.LineItem: [//defines listcolmns 
        { Value: title, Label: 'Title' },
        { Value: price, Label: 'Price' },
        { Value: stock, Label: 'Stock' },
        { Value: author.name, Label: 'Author' }
    ],
    //sections on books obj page
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'generalInfo',
            Label: 'General Info',
            Target: '@UI.FieldGroup#General'
        }
    ],
    UI.FieldGroup #General: { //below fields to above Facet via target @
        $Type: 'UI.FieldGroupType',
        Data: [
            { Value: title, Label: 'Title' },
            { Value: price, Label: 'Price' },
            { Value: stock, Label: 'Stock' }
        ]
    }
);