UITableViewJSON
===============

An example of how to use [AFNetworking](http://github.com/AFNetworking/AFNetworking) library to load an `UITableView` with JSON file.

<img src="http://fethica.github.io/UITableViewJSON/images/screenshot.png" alt="UITableViewJASON example Screenshot" />

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

```objectivec
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

### Load the data into an `NSArray`
* Add `#import "AFJSONRequestOperation.h"` to the `ViewController` class

* Create `loadNinja` function in the `ViewController` class

```objectivec
- (void)loadNinjas {
    
    NSURL *json = [[NSURL alloc] initWithString:@"http://fethica.github.io/UITableViewJSON/characters.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:json];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSMutableArray *tempNinjas = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in JSON) {
            Ninja *ninja = [[Ninja alloc] initWithDictionary:dic];
            [tempNinjas addObject:ninja];
        }
        
        self.ninjas = [[NSArray alloc] initWithArray:tempNinjas];
        
        [self.table reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@", error.localizedDescription);
    }];
    
    [operation start];
}
```

* Call the the function in the `viewDidLoad` to initialise the NSArray property

```objectivec
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Ninjas";
    self.ninjas = [[NSMutableArray alloc] init];
    
    [self loadNinjas];
}
```

* Add `#import "UIImageView+AFNetworking.h"` it's a category to add an additional behaviour to `UIImageView` class
* Load the `UITableView` with the `NSArray` initialized in the `loadNinja` function

```objectivec
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [self.ninjas[indexPath.row] name];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[self.ninjas[indexPath.row] thumbnail]]
                   placeholderImage:[UIImage imageNamed:@"50-50.jpg"]];
    return cell;
}
```


