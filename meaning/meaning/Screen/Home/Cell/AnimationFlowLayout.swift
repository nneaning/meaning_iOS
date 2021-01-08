//
//  AnimationFlowLayout.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

class AnimationFlowLayout: UICollectionViewFlowLayout {
    // 셀이 열의 흐름(세로, 가로)에 따라 이동 할 때 보여지는 것을 담당한다
    
    // MARK: Variable Part
    
    private var firstTime: Bool = false
    // 초기 한번만 설정되기 위해 변수를 선언
    
    override func prepare() {
        super.prepare()
        guard !firstTime else { return }
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        let collectionViewSize = collectionView.bounds
        itemSize = CGSize(width: collectionViewSize.width-50*2, height: 100)
        // itemSize - 셀의 기본 크기
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2 - 50
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        // sectionInset - 섹션간의 여백
        
        scrollDirection = .horizontal
        // 가로 스크롤에 사용할 것이라는 걸 알려준다
        
        minimumLineSpacing = 10 - (itemSize.width - itemSize.width*0.7)/2
        // minimumLineSpacing - 행 사이에 사용할 최소 간격
        // 셀이 작아지면 더 멀리 있게 보이기 때문에 붙여주기 위해서 사용
        
        firstTime = true
        // 한번 설정을 했으면 다시 선언되지 않기 위해 바꿔준다
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // 레이아웃 변경이 필요한지 묻는 함수
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 레이아웃 요소를 가져와서 조정하는 함수
            let superAttributes = super.layoutAttributesForElements(in: rect)
            
            superAttributes?.forEach { attributes in
                guard let collectionView = self.collectionView else { return }
                
                let collectionViewCenter = collectionView.frame.size.width / 2
                // collectionVIewCenter - 컬렉션 뷰의 중앙값으로 변하지 않는 고정 값
                let offsetX = collectionView.contentOffset.x
                // offsetX - 사용자가 스크롤할 때 기준점으로부터 이동한 거리(x축)
                let center = attributes.center.x - offsetX
                // center - 각 셀들의 중앙값
                // 기본 center값은 처음에 collectionView가 로드될 때 값이므로 여기서 offsetX 빼줘서 동적으로 계산한다
                
                let maxDistance = self.itemSize.width + self.minimumLineSpacing
                // maxDistance - 아이템 중앙과 아이템 중앙 사이의 거리
                let dis = min(abs(collectionViewCenter-center), maxDistance)
                // 현재 CollectionView의 가운데에서 cell의 가운데 값을 빼서 가운데 0을 기준으로 1까지 계산하기 위해 계산하는 값
                
                let ratio = (maxDistance - dis)/maxDistance
                // 비율을 구해서 애니메이션을 주기 위한 값
                let scale = ratio * (1-0.7) + 0.7
                
                attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
                // scale에서 identify로 커지는 애니메이션을 준다
            }
            
            return superAttributes
       }
}
