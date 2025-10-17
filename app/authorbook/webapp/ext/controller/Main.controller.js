sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('cap.authorbook.ext.controller.Main', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf cap.authorbook.ext.controller.Main
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				this.base.getView().byId("cap.authorbook::AuthorsList--fe::FilterBar::Authors").triggerSearch();
				var oModel = this.base.getExtensionAPI().getModel();
			}
		}
	});
});
