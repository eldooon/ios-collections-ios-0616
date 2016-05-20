//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    
    NSSortDescriptor *sortAscending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSArray *ascending = [array sortedArrayUsingDescriptors:@[sortAscending]];
    
    return ascending;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    
    NSSortDescriptor *sortDescending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    NSArray *descending = [array sortedArrayUsingDescriptors:@[sortDescending]];
    
    return descending;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    
    NSMutableArray *switchArray = [array mutableCopy];
    [switchArray exchangeObjectAtIndex:0 withObjectAtIndex:[switchArray count]-1];
    
    return switchArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array{
    
    array = [[array reverseObjectEnumerator]allObjects];
    
    return array;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    

    string = [string stringByReplacingOccurrencesOfString:@"a" withString:@"4"];
    string = [string stringByReplacingOccurrencesOfString:@"s" withString:@"5"];
    string = [string stringByReplacingOccurrencesOfString:@"i" withString:@"1"];
    string = [string stringByReplacingOccurrencesOfString:@"l" withString:@"1"];
    string = [string stringByReplacingOccurrencesOfString:@"e" withString:@"3"];
    string = [string stringByReplacingOccurrencesOfString:@"t" withString:@"7"];
    
    return string;

}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    
    NSMutableArray *positiveNegative = [[NSMutableArray alloc]init];
    NSMutableArray *positive = [[NSMutableArray alloc]init];
    NSMutableArray *negative = [[NSMutableArray alloc]init];
    [positiveNegative addObject: negative];
    [positiveNegative addObject: positive];
    
    for (NSNumber *value in array){
        if([value intValue] >= 0){
            [positive addObject:value];
        }
        else{
            [negative addObject:value];
        }
    }

    return positiveNegative;
    
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    
    NSMutableArray *hobbits = [[NSMutableArray alloc]init];
    
    for (NSString *characters in dictionary){
        if ([dictionary[characters] isEqualToString:@"hobbit"]){
            [hobbits addObject:characters];
        }
    }
    return hobbits;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray*)array{
    
    NSMutableArray *beginWithA = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [array count]; i++){
        if ([array[i] hasPrefix: @"a"] || [array[i] hasPrefix: @"A"] ){
            [beginWithA addObject:array[i]];
        }
    }
    
    return beginWithA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    
    NSNumber* sumArray = [array valueForKeyPath: @"@sum.self"];
    
    return [sumArray integerValue];
    
//**    Alternative solution **//
//    NSInteger sumArray = 0;
//    
//    for (NSNumber *num in array){
//        
//        sumArray += [num intValue];
//    }
//
//    return sumArray;
}
   
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    
    NSMutableArray *plural = [[NSMutableArray alloc]init];
    
        for (NSUInteger i = 0; i < [array count]; i++){
            
            if ([array[i] isEqualToString: @"trivium"]){
                
                [plural addObject:@"trivia"];
            }
            
            else if ([array[i] isEqualToString: @"box"]){
                
                [plural addObject:@"boxes"];
            }
            
            else if ([array[i] isEqualToString: @"ox"]){
                
                [plural addObject: @"oxen"];
            }
            
            else if ([array[i] isEqualToString: @"foot"]){
                
                [plural addObject: @"feet"];
            }
            
            else if ([array[i] isEqualToString: @"radius"]){
                
                [plural addObject: @"radii"];
            }
            
            else {
                
                NSString *elsePlural = [array[i] stringByAppendingString:@"s"];
                [plural addObject: elsePlural];
                
            }
        
            
        }
    
    return plural;
    
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    
    NSMutableDictionary *countWord = [[NSMutableDictionary alloc]init];
    NSArray *punctuations = @[@".", @",", @"-"];;
    
    for (NSUInteger i = 0; i < [punctuations count]; i++){
        NSString *punctuation = punctuations[i];
        string = [string stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    string = [string lowercaseString];
    NSArray *splitWord = [string componentsSeparatedByString:@" "];
    
    NSLog(@"%@",splitWord);

    for (NSString *word in splitWord){
        
        
        if (![countWord objectForKey:word]) {
            
            countWord[word] = @(1);
            //Alternative
            //[countWord setObject:[NSNumber numberWithInt:1] forKey:word];
        }
        
        else {
            
            NSInteger countUp = [countWord[word] integerValue];
            countWord[word] = @(countUp +1);
            
            //Alternative - Not working, needs adjustments
            //[countWord setObject:[NSNumber numberWithInt:[countWord objectForKey:word] intValue]+1 forKey:word];
        }
    
    }

    return countWord;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    
    NSMutableDictionary *artistSongs = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger i = 0; i < [array count]; i++){
        
        NSArray *split  = [array[i] componentsSeparatedByString:@" - "];
        NSArray*artists = split[0];
        NSArray *songs = split[1];
        
  
    
        if (![[artistSongs allKeys] containsObject:artists]){
            artistSongs[artists] = [[NSMutableArray alloc]init];
            [artistSongs[artists] addObject:songs];
        }

        else {
            [artistSongs[artists] addObject:songs];
            NSSortDescriptor *sortSongs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
            [artistSongs[artists] sortUsingDescriptors:@[sortSongs]];
        }
    }

    
    
    return artistSongs;
}

@end
