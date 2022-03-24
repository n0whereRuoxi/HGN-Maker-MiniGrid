( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b177 - block
    b203 - block
    b609 - block
    b228 - block
    b962 - block
    b979 - block
    b620 - block
    b554 - block
    b340 - block
    b124 - block
    b350 - block
    b360 - block
    b651 - block
    b462 - block
    b464 - block
    b184 - block
    b96 - block
    b9 - block
    b254 - block
    b794 - block
    b211 - block
    b111 - block
    b779 - block
    b947 - block
    b231 - block
    b780 - block
    b954 - block
    b68 - block
    b90 - block
    b741 - block
    b416 - block
    b546 - block
    b484 - block
    b113 - block
    b802 - block
    b819 - block
    b731 - block
    b763 - block
    b963 - block
    b829 - block
    b502 - block
    b71 - block
    b401 - block
    b214 - block
    b931 - block
    b530 - block
    b607 - block
    b396 - block
    b204 - block
    b781 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b177 )
    ( on b203 b177 )
    ( on b609 b203 )
    ( on b228 b609 )
    ( on b962 b228 )
    ( on b979 b962 )
    ( on b620 b979 )
    ( on b554 b620 )
    ( on b340 b554 )
    ( on b124 b340 )
    ( on b350 b124 )
    ( on b360 b350 )
    ( on b651 b360 )
    ( on b462 b651 )
    ( on b464 b462 )
    ( on b184 b464 )
    ( on b96 b184 )
    ( on b9 b96 )
    ( on b254 b9 )
    ( on b794 b254 )
    ( on b211 b794 )
    ( on b111 b211 )
    ( on b779 b111 )
    ( on b947 b779 )
    ( on b231 b947 )
    ( on b780 b231 )
    ( on b954 b780 )
    ( on b68 b954 )
    ( on b90 b68 )
    ( on b741 b90 )
    ( on b416 b741 )
    ( on b546 b416 )
    ( on b484 b546 )
    ( on b113 b484 )
    ( on b802 b113 )
    ( on b819 b802 )
    ( on b731 b819 )
    ( on b763 b731 )
    ( on b963 b763 )
    ( on b829 b963 )
    ( on b502 b829 )
    ( on b71 b502 )
    ( on b401 b71 )
    ( on b214 b401 )
    ( on b931 b214 )
    ( on b530 b931 )
    ( on b607 b530 )
    ( on b396 b607 )
    ( on b204 b396 )
    ( on b781 b204 )
    ( clear b781 )
  )
  ( :goal
    ( and
      ( clear b177 )
    )
  )
)
