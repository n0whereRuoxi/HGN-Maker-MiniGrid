( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b31 - block
    b228 - block
    b835 - block
    b673 - block
    b947 - block
    b465 - block
    b617 - block
    b879 - block
    b94 - block
    b271 - block
    b715 - block
    b720 - block
    b802 - block
    b467 - block
    b939 - block
    b809 - block
    b479 - block
    b829 - block
    b80 - block
    b338 - block
    b825 - block
    b373 - block
    b306 - block
    b488 - block
    b213 - block
    b845 - block
    b39 - block
    b727 - block
    b113 - block
    b714 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b31 )
    ( on b228 b31 )
    ( on b835 b228 )
    ( on b673 b835 )
    ( on b947 b673 )
    ( on b465 b947 )
    ( on b617 b465 )
    ( on b879 b617 )
    ( on b94 b879 )
    ( on b271 b94 )
    ( on b715 b271 )
    ( on b720 b715 )
    ( on b802 b720 )
    ( on b467 b802 )
    ( on b939 b467 )
    ( on b809 b939 )
    ( on b479 b809 )
    ( on b829 b479 )
    ( on b80 b829 )
    ( on b338 b80 )
    ( on b825 b338 )
    ( on b373 b825 )
    ( on b306 b373 )
    ( on b488 b306 )
    ( on b213 b488 )
    ( on b845 b213 )
    ( on b39 b845 )
    ( on b727 b39 )
    ( on b113 b727 )
    ( on b714 b113 )
    ( clear b714 )
  )
  ( :goal
    ( and
      ( clear b31 )
    )
  )
)
