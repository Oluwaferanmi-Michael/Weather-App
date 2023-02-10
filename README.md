# Weather-App
Creating the same weather application with multiple state management techniques
Throughout every iteration a different technique would be used to manage the app state, saving its searches to a history section and the abillity to delete from the history section

### ValueNotifier
1st App uses the **ValueNotifier** Technique to manage state
Value Notifier is one of flutters default state management ways: it works by simply updating the state based on the values
ie when a value is replaced with something that is not equal to the old value as evaluated by the equaliy operator **(==)**, the Value notifier the notifies its listeners
