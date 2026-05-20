//
//  CitiesTableViewController.m
//  Exercicio4
//
//  Created by  on 20/05/26.
//

#import "CitiesTableViewController.h"
#import "MapViewController.h"

@interface CitiesTableViewController ()

@end

@implementation CitiesTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *region = self.regions[indexPath.section];
    NSDictionary *city = self.cities[region][indexPath.row];
    
    MapViewController *mapVC = [[MapViewController alloc] init];
    mapVC.cityName = city[@"nome"];
    mapVC.latitude = [city[@"latitude"] doubleValue];
    mapVC.longitude = [city[@"longitude"] doubleValue];
    
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
        self.cities = [NSDictionary dictionaryWithContentsOfFile:path];
        self.regions = [self.cities.allKeys sortedArrayUsingSelector:@selector(compare:)];
    
    
    
}



#pragma mark - Table view data source

// Quantas seções
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.regions.count;
}

// Quantas linhas por seção
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *region = self.regions[section];
    return [self.cities[region] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    
    NSString *region = self.regions[indexPath.section];
    NSDictionary *city = self.cities[region][indexPath.row];
    
    cell.textLabel.text = city[@"nome"];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.regions[section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
