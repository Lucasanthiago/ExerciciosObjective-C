//
//  EstadoViewController.m
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import "EstadoViewController.h"
#import "PaginaViewController.h"

@interface EstadoViewController ()

@end

@implementation EstadoViewController

- (void)abrirPaginaComURL:(NSString *)urlString {
    PaginaViewController *pagina = [[PaginaViewController alloc] init];
    pagina.urlString = urlString;
    [self.navigationController pushViewController:pagina animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
