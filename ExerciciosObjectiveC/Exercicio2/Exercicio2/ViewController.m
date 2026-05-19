#import "ViewController.h"
#import <WebKit/WebKit.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.idiomaSelecionado = @"pt";
    
    // WebView
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    // ActivityIndicator
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    self.activityIndicator.center = self.view.center;
    [self.view addSubview:self.activityIndicator];
    
    // SegmentedControl
    self.segmented = [[UISegmentedControl alloc] initWithItems:@[@"Flamengo", @"Vasco", @"Fluminense"]];
    [self.segmented addTarget:self
                       action:@selector(segmentedChanged:)
             forControlEvents:UIControlEventValueChanged];
    self.segmented.selectedSegmentIndex = 0;
    self.navigationItem.titleView = self.segmented;
    
    // Botão de idioma
    UIBarButtonItem *idiomaButton = [[UIBarButtonItem alloc] initWithTitle:@"Português"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(idiomaButtonTapped)];
    self.navigationItem.rightBarButtonItem = idiomaButton;
    
    [self segmentedChanged:self.segmented];
}

- (void)segmentedChanged:(UISegmentedControl *)sender {
    NSString *urlString;
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            urlString = [NSString stringWithFormat:@"https://%@.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo", self.idiomaSelecionado];
            break;
        case 1:
            urlString = [NSString stringWithFormat:@"https://%@.wikipedia.org/wiki/Club_de_Regatas_Vasco_da_Gama", self.idiomaSelecionado];
            break;
        case 2:
            urlString = [NSString stringWithFormat:@"https://%@.wikipedia.org/wiki/Fluminense_Football_Club", self.idiomaSelecionado];
            break;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)idiomaButtonTapped {
    self.picker = [[UIPickerView alloc] init];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    self.picker.frame = CGRectMake(0, 0, 270, 150);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Selecione o idioma"
                                                                   message:@"\n\n\n\n\n"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert.view addSubview:self.picker];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action) {
        NSInteger row = [self.picker selectedRowInComponent:0];
        NSString *idioma = row == 0 ? @"pt" : @"en";
        NSString *titulo = row == 0 ? @"Português" : @"Inglês";
        [self atualizarIdioma:idioma titulo:titulo];
    }];
    
    UIAlertAction *cancelar = [UIAlertAction actionWithTitle:@"Cancelar"
                                                       style:UIAlertActionStyleCancel
                                                     handler:nil];
    
    [alert addAction:cancelar];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)atualizarIdioma:(NSString *)idioma titulo:(NSString *)titulo {
    self.idiomaSelecionado = idioma;
    self.navigationItem.rightBarButtonItem.title = titulo;
    [self segmentedChanged:self.segmented];
}

// MARK: - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.activityIndicator startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.activityIndicator stopAnimating];
}

// MARK: - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

// MARK: - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return row == 0 ? @"Português" : @"Inglês";
}

@end
