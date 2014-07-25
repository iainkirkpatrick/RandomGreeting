//
//  StatsViewController.m
//  RandomGreeting
//
//  Created by Iain Kirkpatrick on 24/07/14.
//  Copyright (c) 2014 Iain Kirkpatrick. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *languageLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *greetingLabels;
@property (strong, nonatomic) NSDictionary *greetings;

@end

@implementation StatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    //testing dummy model
//    
//    self.greetingsCount = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@1,@"Hello!", @2,@"Salut!", @0,@"YoBo!", @4,@"Ciao!", @5,@"Hallo!", @6,@"Czesc!", @7,@"Hola!", @8,@"Ni hao!", @9,@"Kon'nichiwa!", nil];
    
//    //shouldn't be necessary now this dict is lazily instantiated below
//    self.greetings = [[NSDictionary alloc] initWithObjectsAndKeys:@"Hello!",@"English:", @"Czesc!",@"Polish:", @"Ni hao!",@"Chinese:", @"Hola!",@"Spanish:", @"Salut!",@"French:", @"Ciao!",@"Italian:", @"Kon'nichiwa!",@"Japanese:", @"Hallo!",@"German:", @"YoBo!",@"Kiwi:", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//custom getter
- (NSDictionary *)greetings {
    if (!_greetings) {
        _greetings = [[NSDictionary alloc] initWithObjectsAndKeys:@"Hello!",@"English:", @"Czesc!",@"Polish:", @"Ni hao!",@"Chinese:", @"Hola!",@"Spanish:", @"Salut!",@"French:", @"Ciao!",@"Italian:", @"Kon'nichiwa!",@"Japanese:", @"Hallo!",@"German:", @"YoBo!",@"Kiwi:", nil];
    };
    return _greetings;
}

- (void)updateGreetings:(NSMutableDictionary *)greetingsCount {
    _greetingsCount = greetingsCount;
    if (self.view.window) {
        [self updateUI];
    };
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI {
    for (UILabel *languageLabel in self.languageLabels) {
        
        //get associated greeting
        NSString *greeting = [self.greetings objectForKey:languageLabel.text];
        
        //loop over model against greeting
        for (NSString *greetingKey in self.greetingsCount) {
            if ([greeting isEqualToString:greetingKey]) {
                
                //if the count is more than 0, un-hide the label
                int count = [[self.greetingsCount objectForKey:greetingKey] intValue];
                if (count > 0) {
                    
                    //get the correct label
                    for (UILabel *greetingLabel in self.greetingLabels) {
                        if ([greetingLabel.text isEqualToString:greeting]) {
                            [greetingLabel setHidden:NO];
                        }
                    }
                }
            }
        }
    }
}

@end
