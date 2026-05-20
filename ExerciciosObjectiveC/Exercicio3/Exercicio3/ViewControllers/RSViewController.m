//
//  RSViewController.m
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import "RSViewController.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    NSArray *times = @[@"Internacional", @"Porto"];
    NSArray *urls = @[
        @"https://pt.wikipedia.org/wiki/Sport_Club_Internacional",
        @"https://pt.wikipedia.org/wiki/Gr%C3%AAmio_Foot-Ball_Porto_Alegrense"
    ];
    
    for (int i = 0; i < times.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:times[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(20, 100 + (i * 60), 280, 50);
        btn.tag = i;
        [btn addTarget:self action:@selector(timeTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    self.urls = urls;
}

- (void)timeTapped:(UIButton *)sender {
    [self abrirPaginaComURL:self.urls[sender.tag]];
}


@end
