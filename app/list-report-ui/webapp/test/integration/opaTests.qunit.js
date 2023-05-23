sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ndbs/training/listreportui/test/integration/FirstJourney',
		'ndbs/training/listreportui/test/integration/pages/PersonnelsList',
		'ndbs/training/listreportui/test/integration/pages/PersonnelsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PersonnelsList, PersonnelsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ndbs/training/listreportui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePersonnelsList: PersonnelsList,
					onThePersonnelsObjectPage: PersonnelsObjectPage
                }
            },
            opaJourney.run
        );
    }
);