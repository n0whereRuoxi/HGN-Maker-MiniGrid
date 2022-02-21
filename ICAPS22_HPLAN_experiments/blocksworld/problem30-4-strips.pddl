( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b525 - block
    b293 - block
    b672 - block
    b786 - block
    b484 - block
    b344 - block
    b70 - block
    b729 - block
    b554 - block
    b132 - block
    b638 - block
    b737 - block
    b908 - block
    b736 - block
    b43 - block
    b850 - block
    b177 - block
    b584 - block
    b68 - block
    b968 - block
    b295 - block
    b389 - block
    b161 - block
    b663 - block
    b744 - block
    b447 - block
    b490 - block
    b73 - block
    b854 - block
    b851 - block
    b271 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b525 )
    ( on b293 b525 )
    ( on b672 b293 )
    ( on b786 b672 )
    ( on b484 b786 )
    ( on b344 b484 )
    ( on b70 b344 )
    ( on b729 b70 )
    ( on b554 b729 )
    ( on b132 b554 )
    ( on b638 b132 )
    ( on b737 b638 )
    ( on b908 b737 )
    ( on b736 b908 )
    ( on b43 b736 )
    ( on b850 b43 )
    ( on b177 b850 )
    ( on b584 b177 )
    ( on b68 b584 )
    ( on b968 b68 )
    ( on b295 b968 )
    ( on b389 b295 )
    ( on b161 b389 )
    ( on b663 b161 )
    ( on b744 b663 )
    ( on b447 b744 )
    ( on b490 b447 )
    ( on b73 b490 )
    ( on b854 b73 )
    ( on b851 b854 )
    ( on b271 b851 )
    ( clear b271 )
  )
  ( :goal
    ( and
      ( clear b525 )
    )
  )
)
