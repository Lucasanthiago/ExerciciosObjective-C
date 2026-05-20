//
//  PaginaViewController.h
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaginaViewController : UIViewController

@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END



