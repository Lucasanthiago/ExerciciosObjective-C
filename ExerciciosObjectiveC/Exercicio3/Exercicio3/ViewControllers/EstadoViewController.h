//
//  EstadoViewController.h
//  Exercicio3
//
//  Created by  on 20/05/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EstadoViewController : UIViewController
@property (strong, nonatomic) NSArray *urls;


- (void)abrirPaginaComURL:(NSString *)urlString;


@end

NS_ASSUME_NONNULL_END
