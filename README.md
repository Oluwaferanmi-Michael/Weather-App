# 1. Weather-App
Creating the same weather application with multiple state management techniques
Throughout every iteration a different technique would be used to manage the app state, saving its searches to a history section and the abillity to delete from the history section

### 2. ValueNotifier
1st App uses the **ValueNotifier** Technique to manage state
Value Notifier is one of flutters default state management ways: it works by simply updating the state based on the values
ie when a value is replaced with something that is not equal to the old value as evaluated by the equaliy operator **(==)**, the Value notifier the notifies its listeners

### Inherited Widget
2nd app Uses the **Inherited Widget** technique I used primarily for themeing and asset management
Inherited Widgets is used to pass information down the widget tree rather than having it built in to every method, class, or Object. Inheriited Widgets are immutable yet 'changeable' like a hybrid class of Stateless and Stateful widgets, Inherited widgets can be reassigned values using the in-built `updateShouldNotify` method. A real life example say theres an notice board handing out phone numbers to the nearest call center and everytime the number is updated you'd have to go back and collect the new number(state), with inherited widgets everyone would just receive the updated numbers automatically and be in tune with the change as long as it is not equal to the old widget value.
