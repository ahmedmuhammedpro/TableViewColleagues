#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController {
    
    NSMutableArray *males;
    NSMutableArray *females;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    males = [NSMutableArray new];
    [males addObject: @"Ahmed"];
    [males addObject: @"Mohamed"];
    [males addObject: @"Moneam"];
    [males addObject: @"Medhat"];
    [males addObject: @"Shaker"];
    
    females = [NSMutableArray new];
    [females addObject: @"Sara"];
    [females addObject: @"Enas"];
    [females addObject: @"Mai"];
    [females addObject: @"Esraa"];
    [females addObject: @"Passant"];
    [females addObject: @"Maha"];
    [females addObject: @"Fatma"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return [males count];
            
        case 1:
            return [females count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"cell"];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [males objectAtIndex: indexPath.row];
            break;
            
        case 1:
            cell.textLabel.text = [females objectAtIndex: indexPath.row];
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return section == 0? @"Males" : @"Females";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        switch (indexPath.section) {
            case 0:
                [males removeObjectAtIndex: indexPath.row];
                break;
                
            case 1:
                [females removeObjectAtIndex: indexPath.row];
                break;
        }
        
        [tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationFade];
    }
}

@end
