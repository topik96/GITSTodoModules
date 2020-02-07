//
//  ViewController.m
//  Todo-Main-Objc-C
//
//  Created by topik mujianto on 07/02/20.
//  Copyright © 2020 topik mujianto. All rights reserved.
//

#import "ViewController.h"
@import GITSTodo;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray<NSString *> *todos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NetworkManager getTodosOnSuccess:^(NSArray<NSString *> *result){
        self.todos = result;
        [self.tableView reloadData];
    } onError:^(NSString *error){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                       message: error
                                       preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];

        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

//MARK- UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_TODO"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL_TODO"];
    }
    cell.textLabel.text = self.todos[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}


@end
