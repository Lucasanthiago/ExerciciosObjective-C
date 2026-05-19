#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKNavigationDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) UIPickerView *picker;
@property (strong, nonatomic) NSString *idiomaSelecionado;
@property (strong, nonatomic) UISegmentedControl *segmented;

@end
