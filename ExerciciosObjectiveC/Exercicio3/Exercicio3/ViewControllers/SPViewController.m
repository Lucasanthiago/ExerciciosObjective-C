//
//  SPViewController.m
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import "SPViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *times = @[@"Corinthians", @"Palmeiras", @"Santos", @"São Paulo"];
    NSArray *urls = @[
        @"https://pt.wikipedia.org/wiki/Sport_Club_Corinthians_Paulista",
        @"https://pt.wikipedia.org/wiki/Sociedade_Esportiva_Palmeiras",
        @"https://pt.wikipedia.org/wiki/Santos_Futebol_Clube",
        @"https://pt.wikipedia.org/wiki/S%C3%A3o_Paulo_Futebol_Clube"
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
