( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b342 - block
    b851 - block
    b508 - block
    b833 - block
    b474 - block
    b124 - block
    b884 - block
    b797 - block
    b112 - block
    b915 - block
    b2 - block
    b146 - block
    b857 - block
    b702 - block
    b974 - block
    b804 - block
    b959 - block
    b515 - block
    b615 - block
    b390 - block
    b218 - block
    b238 - block
    b765 - block
    b767 - block
    b541 - block
    b71 - block
    b385 - block
    b135 - block
    b740 - block
    b495 - block
    b876 - block
    b375 - block
    b708 - block
    b516 - block
    b247 - block
    b316 - block
    b435 - block
    b582 - block
    b530 - block
    b270 - block
    b610 - block
    b929 - block
    b436 - block
    b199 - block
    b62 - block
    b821 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b851 b342 )
    ( on b508 b851 )
    ( on b833 b508 )
    ( on b474 b833 )
    ( on b124 b474 )
    ( on b884 b124 )
    ( on b797 b884 )
    ( on b112 b797 )
    ( on b915 b112 )
    ( on b2 b915 )
    ( on b146 b2 )
    ( on b857 b146 )
    ( on b702 b857 )
    ( on b974 b702 )
    ( on b804 b974 )
    ( on b959 b804 )
    ( on b515 b959 )
    ( on b615 b515 )
    ( on b390 b615 )
    ( on b218 b390 )
    ( on b238 b218 )
    ( on b765 b238 )
    ( on b767 b765 )
    ( on b541 b767 )
    ( on b71 b541 )
    ( on b385 b71 )
    ( on b135 b385 )
    ( on b740 b135 )
    ( on b495 b740 )
    ( on b876 b495 )
    ( on b375 b876 )
    ( on b708 b375 )
    ( on b516 b708 )
    ( on b247 b516 )
    ( on b316 b247 )
    ( on b435 b316 )
    ( on b582 b435 )
    ( on b530 b582 )
    ( on b270 b530 )
    ( on b610 b270 )
    ( on b929 b610 )
    ( on b436 b929 )
    ( on b199 b436 )
    ( on b62 b199 )
    ( on b821 b62 )
    ( clear b821 )
  )
  ( :goal
    ( and
      ( clear b342 )
    )
  )
)
