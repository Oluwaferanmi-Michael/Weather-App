# Weather-App
Creating the same weather application with multiple state management techniques

### By definition
`State is information that (1) can be read synchronously when the widget is built and (2) might change during the lifetime of the widget. It is the responsibility of the widget implementer to ensure that the State is promptly notified when such state changes`

Throughout every iteration a different technique would be used to manage the app state,

### 1. ValueNotifier
1st App uses the **ValueNotifier** Technique to manage state
Value Notifier is one of flutters default state management ways: it works by simply updating the state based on the values
ie when a value is replaced with something that is not equal to the old value as evaluated by the equaliy operator **(==)**, the Value notifier the notifies its listeners

### 2. Inherited Widget
2nd app Uses the **Inherited Widget** technique I used primarily for themeing and asset management
Inherited Widgets are used to pass information down the widget tree rather than having it built in to every method, class, or Object. Inheriited Widgets are immutable, they use a constant constructor yet 'changeable' when inserted(wrapped, embedded) in a stateful widget like a hybrid class of Stateless and Stateful widgets, Inherited widgets can be reassigned values using the in-built `updateShouldNotify` method. 

The biggest difference between an inherited widget and a stateful widget is that when `setState` is called in a stateful widget, depending on if the data(state) changed or not each widget would be redrawn and inherited widget gives you the ability to check using the `updateShouldNotify` method and decide whether or not they should be redrawn.

A real life analogy: say theres an notice board handing out phone numbers to the nearest emergency call center and everytime the number is updated you'd have to go back and collect the new number(state), with inherited widgets everyone would just receive the updated numbers automatically and the board then decides whether or not people should receive this new number. if the board decides no(false) nothing gets updated, if yes(true) everyone would get the update.

### 3. Inherited Model
While very similar with Inherited widget it's like a level up of the Inherited widget
The Inherited Model has the ability to select which aspects of your data(state) should change,
With the inherited Widget all aspects of the children in the widget tree will get updated in the inherited widgets state has changed but the Inherited model on the contrary would check for what part(aspects) of the children has changed and would update that instead of everyone. to achieve this the Inherited Model uses the `updateShouldNotifyDependencies` method.

using the analogy above the eventuality if using an inherited model would be that the board nw has the freedom to decide who gets the new information and only those people will be updated.

### 3. Inherited Notifier and Change Notifier
(The main difference between Inh widg and Inh Noti is that while Inherited Widget holds on to it's own values, the Inh Not doesnt, instead it refers and holds on to listenables like the Change Notifier, StateNotifier and ValueNotifier, )

### 4. Flutter Hooks
Honestly I don't know what to say I'm pained I didnt find this solution earlier in my flutter journey...but I just did and I understand it.

So Flutter hooks, an idea borrowed from React Hooks as a way(pattern) of implementing and managing state and actions w/o the use of a stateful widget; Although because of the Hot reload and restart function that flutter has, the hooks system has to be run from the build() method of a HookWidget(similar to Stateless Widgets) a primary concern would be the app becomes overloaded because it will constantly rebuild thanks to the hooks management and change of app state, this can be fixed however with hooks like `useMemoized` and `useMemory` that remember and preserve app state.

Flutter hooks are a way to use code w/o having to re-write boiler-plate over and over, it's also a nice alternative to mixins.


### 5. Flutter Riverpod
A State management solution Created by Remi, uses Global Variables and function to manage state. like any other state management solution under the hood it uses Stateful and Stateless widgets to manage state. howeveer in using this package state management can be done solely with stateless widgets(Consumer widgets) because implemetation like setState have been taken care of by the framework. riverpod uses Providers which are Objects that encapsulate a piece of state and allows listening and observing that state. there are different types of Providers namely: `Provider`, `StateProvider`, `FutureProvider`, `StreamProvider`, `StateNotifierProider`, `ChangeNotifierProvider`, all of them serve a purpose that covers all of flutters base data/state management techniques, the simplicity and versatility of providers in riverpod then allows for more complex implementation to be understood
