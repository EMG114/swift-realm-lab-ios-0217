# Realm

## Objectives
+ Learn Realm
+ Save Objects to Realm
+ Retrieve Objects From Realm
+ Add an object to another Object



## Realm


Realm is a cross-platform mobile database solution that is designed to be fast, lightweight and most importantly simple to integrate into any project. 

Realm does not rely on CoreData or even a SQLite database. 

In Core Data we were accustomed to creating our entities and attributes in the Object Model. Realm does not require us to do any of that. All we need do is to create a `Object` subclass and Realm will do the rest for us

```
import RealmSwift

class Pet: Object {
dynamic var name: String = ""
}

```

Let's take this class further and write an initializer that takes in a string value and assigns it to the name property. To do this with Realm we will need to add a convenience initializer.


```
class Task: Object {
dynamic var name: String = ""

convenience init(_content: String) {
self.init()
self.content = content
}
}
```


Now that we have a Realm object how do we add this to Realm.

```
let task = Task("Wash Dishes")
let realm = try! Realm()
try! realm.write {
realm.add(task)
}
```


Now what if we wanted to retrieve this item from our database


```
let tasks: Results<Task>!
let realm = try! Realm()
tasks = realm.objects(Task.self)


```


Voila! As you can see Realm is alot easier than Core Data. The challenge for you now is to following the instructions below and complete the lab. **Note** We have purposefully left out some of the necessary information to challenge you to read the documentation. The Realm docs do an amazing job of explaining how to use it so use this to your advantage.


## Instructions

1. Watch the video to see how this app is expected to be laid out.
2. Using the information above complete our two Realm classes `SavedEpisode` and `SavedShow`. **Hint** You may also want to write a way to convert an `Episode` object into a `SavedEpisode` object. 
3. To complete these two objects you will want to provide them a way of accessing each other. 
**Hint** This will require you to look up `Lists` ([to-Many Relationships](https://realm.io/docs/swift/latest/#to-many-relationships)) and [Inverse Relationships](https://realm.io/docs/swift/latest/#inverse-relationships). `SavedShow` will need a episodes property and `SavedEpisode` will need a `show` property. The one caveat here is that inverse relationships act as a collection and therefore you will need to grab the first value
4. Open the `RealmManager` class created for you. There are two class functions included for you. To save a Show, create a `SavedShow` object and save it to Realm. When saving an `Episode` you must first retrieve the corresponding `SavedShow` and add the `SavedEpisode` to the `SavedShow`. You will also need to write functions to retrieve `SavedShow`s and `SavedEpisodes`. You do not need to write a function to retrieve the episodes for a show since it should exist as a property on the `SavedShow` object


## Resources

* [Realm Models](https://realm.io/docs/swift/latest/#models)
* [Saving to Realm](https://realm.io/docs/swift/latest/#adding-objects)
* [Retrieving from Realm]()
* [Adding from one Realm object to another]()
* [Relationships](https://realm.io/docs/swift/latest/#to-many-relationships)
* [Inverse-Relationships](https://realm.io/docs/swift/latest/#inverse-relationships)
