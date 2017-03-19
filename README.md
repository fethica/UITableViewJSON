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
* Add `#import "AFHTTPSessionManager.h"` to the `TableViewController` class

* Create `loadNinja` function in the `TableViewController` class

```objectivec
- (void)loadNinjas {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://fethica.github.io/UITableViewJSON/characters.json" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *jsonArray = (NSArray *)responseObject;
        NSMutableArray *tempNinjas = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in jsonArray) {
            Ninja *ninja = [[Ninja alloc] initWithDictionary:dic];
            [tempNinjas addObject:ninja];
        }
        
        self.ninjas = [[NSArray alloc] initWithArray:tempNinjas];
        tempNinjas = nil;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Ninjas"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];

}
```

* Call the the function in the `viewDidLoad` to initialise the NSArray property

```objectivec
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Ninjas";
    
    [self loadNinjas];
    
    // Remove empty cells
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
```

* Add `#import "UIImageView+AFNetworking.h"` it's a category to add an additional behaviour to `UIImageView` class
* Load the `UITableView` with the `NSArray` initialized in the `loadNinja` function

```objectivec
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.ninjas[indexPath.row] name];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:[self.ninjas[indexPath.row] thumbnail]]
                   placeholderImage:[UIImage imageNamed:@"50-50.jpg"]];
    
    return cell;
}
```


