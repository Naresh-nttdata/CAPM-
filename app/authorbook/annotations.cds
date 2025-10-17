using CatalogService as service from '../../srv/cat-service';

annotate service.Authors with @(
    UI.HeaderInfo: {
        TypeName: 'Author',
        TypeNamePlural: 'Authors',
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
            ID: 'GeneralInfo',
            Label: 'General Information',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'BooksFacet',
            Label: 'Books',
            Target: 'books/@UI.LineItem'//linked to below book entity
        }
    ],
    UI.FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { Value: name, Label: 'Name' },
            { Value: biography, Label: 'Biography' }
        ]
    }
);


annotate service.Books with @(
    UI.CreateHidden: false,
    UI.DeleteHidden: false,
    UI.HeaderInfo: {
        TypeName: 'Book',
        TypeNamePlural: 'Books',
        Title: { Value: title },
        Description: { Value: author.name }
    },
    UI.LineItem: [//defines listcolmns 
        { Value: title, Label: 'Title' },
        { Value: price, Label: 'Price' },
        { Value: stock, Label: 'Stock' },
        { Value: author.name, Label: 'Author' }
    ],
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'GeneralInfo',
            Label: 'General Information',
            Target: '@UI.FieldGroup#General'
        }
    ],
    UI.FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Data: [
            { Value: title, Label: 'Title' },
            { Value: price, Label: 'Price' },
            { Value: stock, Label: 'Stock' }
        ]
    },
    UI.FieldGroup #AuthorDetails: {//below fields to above Facet via target @
        $Type: 'UI.FieldGroupType',
        Data: [
            { Value: author.name, Label: 'Author Name' },
            { Value: author.biography, Label: 'Author Biography' }
        ]
    }
);