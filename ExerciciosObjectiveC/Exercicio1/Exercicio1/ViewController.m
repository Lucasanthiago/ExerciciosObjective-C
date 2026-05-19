//
//  ViewController.m
//  Exercicio1
//
//  Created by  on 11/05/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                            action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    
}


- (IBAction)buttonTapped:(id)sender {
    
    NSString *titulo;
    NSString *mensagem;

    if (self.textfield.text.length == 0) {
        titulo = @"Erro";
        mensagem = @"Por favor preencha o campo de texto";
    } else {
        titulo = @"Sucesso";
        mensagem = self.textfield.text;
    }
    

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:titulo
                                                                       message:mensagem
                                                                       preferredStyle:UIAlertControllerStyleAlert
        ];
    
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                     handler:nil];
    
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
}


- (void)dismissKeyboard {
    [self.view endEditing:YES];
}


@end
