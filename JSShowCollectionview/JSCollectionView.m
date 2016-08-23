//
//  JSCollectionView.m
//  ZXShowCollectionview
//
//  Created by 张喜 on 16/8/18.
//  Copyright © 2016年 zhang.com. All rights reserved.
//

#import "JSCollectionView.h"

@interface JSCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end



@implementation JSCollectionView


+(JSCollectionView *)JSManagementCollectionViewWithScrollView:(UIScrollView *)ScrollView{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    
    JSCollectionView *jsCv=[[JSCollectionView alloc]initWithFrame:CGRectMake(0,ScrollView.frame.origin.y+ScrollView.frame.size.height,screenW, screenH) collectionViewLayout:flowLayout];
    
    [jsCv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    jsCv.showsHorizontalScrollIndicator=NO;
    jsCv.pagingEnabled=YES;
    jsCv.bounces =NO;
    
    jsCv.backgroundColor=[UIColor whiteColor];
    
    jsCv.delegate=jsCv;
    jsCv.dataSource=jsCv;
    
    return jsCv;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.channelAyyay.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
     UITableView *tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, screenW, screenH);
    tableView.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    [cell addSubview:tableView];
    
    return cell;
}


//正在滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    JSChannelView *nextBtn = nil;
    
    NSArray *array=[self.collectionView indexPathsForVisibleItems];
    
    for (NSIndexPath *indexPath in array) {
        if (indexPath.item !=self.currentIndex) {
            nextBtn=self.scrollView.subviews[indexPath.item];
            break;
        }
    }
    
    if (nextBtn==nil) {
        return;
    }

}

//停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([self.jSdelegate respondsToSelector:@selector(JSCollectionViewDidEndDecelerating:)]) {
        [self.jSdelegate JSCollectionViewDidEndDecelerating:scrollView];
    }
    
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(screenW,screenH);
    
}

//定义每个Section 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(50, 15, 5, 15);//分别为上、左、下、右
//}

//每个section中不同的行之间的行间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}



//判断现在点中了个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// 取消选中
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZXLog(@"okoko");
    
}


@end


