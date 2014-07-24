//
//  RandomGreetingViewController.m
//  RandomGreeting
//
//  Created by Iain Kirkpatrick on 16/07/14.
//  Copyright (c) 2014 Iain Kirkpatrick. All rights reserved.
//

#import "RandomGreetingViewController.h"
#import "Greetings.h"

@interface RandomGreetingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (strong, nonatomic) Greetings *greetings;

@end

@implementation RandomGreetingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//custom getter
- (Greetings *)greetings {
    if (!_greetings) {
        _greetings = [[Greetings alloc] init];
    };
    return _greetings;
}


- (IBAction)greetMe:(UIButton *)sender {
    
    [self.greetingLabel setText:[self.greetings getRandomGreeting]];
}

@end
