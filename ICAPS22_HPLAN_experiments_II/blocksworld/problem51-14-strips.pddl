( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b75 - block
    b535 - block
    b43 - block
    b629 - block
    b763 - block
    b619 - block
    b634 - block
    b435 - block
    b624 - block
    b852 - block
    b570 - block
    b119 - block
    b726 - block
    b707 - block
    b640 - block
    b938 - block
    b238 - block
    b83 - block
    b734 - block
    b271 - block
    b228 - block
    b20 - block
    b606 - block
    b970 - block
    b185 - block
    b563 - block
    b306 - block
    b511 - block
    b731 - block
    b696 - block
    b82 - block
    b173 - block
    b233 - block
    b195 - block
    b189 - block
    b50 - block
    b150 - block
    b310 - block
    b740 - block
    b736 - block
    b234 - block
    b321 - block
    b508 - block
    b779 - block
    b198 - block
    b167 - block
    b402 - block
    b146 - block
    b845 - block
    b725 - block
    b844 - block
    b256 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b75 )
    ( on b535 b75 )
    ( on b43 b535 )
    ( on b629 b43 )
    ( on b763 b629 )
    ( on b619 b763 )
    ( on b634 b619 )
    ( on b435 b634 )
    ( on b624 b435 )
    ( on b852 b624 )
    ( on b570 b852 )
    ( on b119 b570 )
    ( on b726 b119 )
    ( on b707 b726 )
    ( on b640 b707 )
    ( on b938 b640 )
    ( on b238 b938 )
    ( on b83 b238 )
    ( on b734 b83 )
    ( on b271 b734 )
    ( on b228 b271 )
    ( on b20 b228 )
    ( on b606 b20 )
    ( on b970 b606 )
    ( on b185 b970 )
    ( on b563 b185 )
    ( on b306 b563 )
    ( on b511 b306 )
    ( on b731 b511 )
    ( on b696 b731 )
    ( on b82 b696 )
    ( on b173 b82 )
    ( on b233 b173 )
    ( on b195 b233 )
    ( on b189 b195 )
    ( on b50 b189 )
    ( on b150 b50 )
    ( on b310 b150 )
    ( on b740 b310 )
    ( on b736 b740 )
    ( on b234 b736 )
    ( on b321 b234 )
    ( on b508 b321 )
    ( on b779 b508 )
    ( on b198 b779 )
    ( on b167 b198 )
    ( on b402 b167 )
    ( on b146 b402 )
    ( on b845 b146 )
    ( on b725 b845 )
    ( on b844 b725 )
    ( on b256 b844 )
    ( clear b256 )
  )
  ( :goal
    ( and
      ( clear b75 )
    )
  )
)
