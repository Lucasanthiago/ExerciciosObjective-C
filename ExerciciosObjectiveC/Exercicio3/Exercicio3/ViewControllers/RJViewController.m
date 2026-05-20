//
//  RJViewController.m
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import "RJViewController.h"

@interface RJViewController ()

@end

@implementation RJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *times = @[@"Flamengo", @"Botafogo", @"Vasco", @"Fluminense"];
    NSArray *urls = @[
        @"https://pt.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo",
        @"https://pt.wikipedia.org/wiki/Botafogo_de_Futebol_e_Regatas",
        @"https://pt.wikipedia.org/wiki/Club_de_Regatas_Vasco_da_Gama",
        @"https://pt.wikipedia.org/wiki/Fluminense_Football_Club"
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
