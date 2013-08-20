UITableViewJSON
===============

An example of how to use [AFNetworking](http://github.com/AFNetworking/AFNetworking) library to load an `UITableView` with JSON file.

### The JSON file

[characters.json](http://github.com/fethica/UITableViewJSON/blob/gh-pages/characters.json) an array of objects:

```javascript
[
    {
        "name": "Naruto Uzumaki",
        "thumbnail": "http://fethica.github.io/UITableViewJSON/images/thumbs/naruto.png",
        "photo": "http://fethica.github.io/UITableViewJSON/images/profile/naruto.png",
        "description": "Naruto was born as the son of the Fourth Hokage, Minato Namikaze..."
    },
    {
        "name": "Sasuke Uchiha",
        "thumbnail": "http://fethica.github.io/UITableViewJSON/images/thumbs/sasuke.png",
        "photo": "http://fethica.github.io/UITableViewJSON/images/profile/sasuke.jpg",
        "description": "Sasuke is the second and youngest son of the Konoha Military Police Force ..."
    }
    
    ...
]
```

### The Ninja object

To initialise each JSON objet in it:

```objective-c
@interface Ninja : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *thumbnail;
@property (strong, nonatomic)NSString *photo;
@property (strong, nonatomic)NSString *desc;

- (id)initWithName:(NSString *)aName
         thumbnail:(NSString *)aThumbnail
             photo:(NSString *)aPhoto
       description:(NSString *)aDescription;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
```




