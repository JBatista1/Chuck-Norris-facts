# Chuck-Norris-facts
This repository refers to developing an application in the iOS environment that shows interesting facts about Chuck Noris using the chucknorris.io api available at https://api.chucknorris.io/.



### Application designed to submit to a technical challenge
Below you can read some of my decisions and implementation logic.

### Main decisions:

**Git flow**

The Git flow model was used for visually easier workflow as it is already a standard known to developers.

**Controller Initialization:**

When starting the controller I pass a *ProviderProtocol* protocol, which returns a value, which is responsible for downloading for fetching the data. Once booted and the user is not connected to the internet and if he has previously saved data in chuck norris database it would be possible to boot from sources other than the api


**Network layer**

The decision about the network layer was to use protocols so that all REST functions can be performed in the same way, changing only a few variables. This is the pattern that some research has seen that is mostly used outside framework. No framework was used to better manipulate data and how it works, as it had never implemented one before. I also created the ServiceProtocol which is responsible for receiving all variables that will be joined to generate a request, so you can make a request to any API, just pass the correct attributes.

For testing, because it was working with protocol, it was easy to create a mock to test if the request was being called and if it was returning the correct values, in the case passed by a local Json.


**AlertsError**

The AlertsError class was created to create a UIAlertController that will be displayed in the view. As there were errors beyond the REST I create the TypeError class, and in AlertError, if you pass a Rest error it treats and converts it to TypeError. Previously the AlertsError class itself was responsible for performing a present on the saw, but was removed because it is performing work of another class.


**RXSwift**

Two RX swift variables were created to send data between *SearchFactViewController* and *HomeViewController* when searching. The type chosen was *PublishSubject* because it does not need to be initialized. And the other variable was created to pass the table data to the controller at the push of a button. .tag was used to pass the mobile number in place of indexPath.row.

We tried to use RXcocoa to create the buttons and table, however I had not used the framework, and chose to use the native apple frameworks.


**FactDatasource**

This protocol was created to remove the controller's work of behaving the datasource of the table, avoiding that a massive view controller is created. It receives a table and the items and sets these values and their respective delegates in the table. and *self.tableView? .reloadSections ([0], with: .automatic)* was used to have a more fluid animation when updating data along with *self.tableView? .scrollToRow (at: IndexPath.init (row: 0, section: 0), at: .top, animated: true)* to go to the top of the table.


**FactTableViewCell**

I chose to create a function called setup so that the controller does not add the view values directly, as it is the responsibility of the view. Just as before adding the values the fact has to pass *FactSettings* which leaves the data as requested. like font size and get the first element of the category array and set as the category, or add UNCATEGORIZED if it doesn't exist


**UI test**

I performed snapshot testing using the *Quick*, *Nimble* and *Nimble_Snapshots* frameworks, as well as created an enum that is to add the screen dimensions of the device for testing, such as iphone 8 and 11 and its positioning as portrait or landscape. simulating a device even though in this case the simulator is the *UIViewForSnapShot* class.


**ViewCode**

CodeView protocol was created to ensure that views were added as well as constraints. It is noteworthy that for the cell phone to grow according to the text, a view was created that is instantiate according to the width of the text, ie the view grows according to the text and then added to the screen.


**Switch screen**

The SetupViewInHome enum was created to perform the HomeCiewController view changes according to its state. Like the initial view, with an icon, when no result is found or when a table is added.
