( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b535 - block
    b382 - block
    b526 - block
    b594 - block
    b690 - block
    b387 - block
    b369 - block
    b929 - block
    b121 - block
    b645 - block
    b36 - block
    b570 - block
    b649 - block
    b39 - block
    b619 - block
    b546 - block
    b332 - block
    b166 - block
    b921 - block
    b549 - block
    b13 - block
    b837 - block
    b519 - block
    b670 - block
    b841 - block
    b952 - block
    b325 - block
    b440 - block
    b723 - block
    b183 - block
    b956 - block
    b381 - block
    b557 - block
    b650 - block
    b910 - block
    b481 - block
    b155 - block
    b42 - block
    b241 - block
    b703 - block
    b344 - block
    b663 - block
    b573 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b535 b180 )
    ( on b382 b535 )
    ( on b526 b382 )
    ( on b594 b526 )
    ( on b690 b594 )
    ( on b387 b690 )
    ( on b369 b387 )
    ( on b929 b369 )
    ( on b121 b929 )
    ( on b645 b121 )
    ( on b36 b645 )
    ( on b570 b36 )
    ( on b649 b570 )
    ( on b39 b649 )
    ( on b619 b39 )
    ( on b546 b619 )
    ( on b332 b546 )
    ( on b166 b332 )
    ( on b921 b166 )
    ( on b549 b921 )
    ( on b13 b549 )
    ( on b837 b13 )
    ( on b519 b837 )
    ( on b670 b519 )
    ( on b841 b670 )
    ( on b952 b841 )
    ( on b325 b952 )
    ( on b440 b325 )
    ( on b723 b440 )
    ( on b183 b723 )
    ( on b956 b183 )
    ( on b381 b956 )
    ( on b557 b381 )
    ( on b650 b557 )
    ( on b910 b650 )
    ( on b481 b910 )
    ( on b155 b481 )
    ( on b42 b155 )
    ( on b241 b42 )
    ( on b703 b241 )
    ( on b344 b703 )
    ( on b663 b344 )
    ( on b573 b663 )
    ( on b414 b573 )
    ( clear b414 )
  )
  ( :goal
    ( and
      ( clear b180 )
    )
  )
)
