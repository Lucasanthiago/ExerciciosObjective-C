//
//  MGViewController.m
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import "MGViewController.h"

@interface MGViewController ()

@end

@implementation MGViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *times = @[@"Cruzeiro", @"Atletico Mineiro"];
    NSArray *urls = @[
        @"https://pt.wikipedia.org/wiki/Cruzeiro_Esporte_Clube",
        @"https://pt.wikipedia.org/wiki/Clube_Atl%C3%A9tico_Mineiro"
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
