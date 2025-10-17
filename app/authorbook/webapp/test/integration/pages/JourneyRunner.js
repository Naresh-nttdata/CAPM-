sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"cap/authorbook/test/integration/pages/AuthorsList",
	"cap/authorbook/test/integration/pages/AuthorsObjectPage",
	"cap/authorbook/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, AuthorsList, AuthorsObjectPage, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('cap/authorbook') + '/test/flp.html#app-preview',
        pages: {
			onTheAuthorsList: AuthorsList,
			onTheAuthorsObjectPage: AuthorsObjectPage,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});

