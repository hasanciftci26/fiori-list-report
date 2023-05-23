sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ndbs.training.listreportui',
            componentId: 'PersonnelsList',
            entitySet: 'Personnels'
        },
        CustomPageDefinitions
    );
});