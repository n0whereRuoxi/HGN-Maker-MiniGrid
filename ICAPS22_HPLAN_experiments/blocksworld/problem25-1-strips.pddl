( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b957 - block
    b657 - block
    b179 - block
    b526 - block
    b884 - block
    b993 - block
    b930 - block
    b442 - block
    b231 - block
    b569 - block
    b450 - block
    b132 - block
    b981 - block
    b768 - block
    b320 - block
    b824 - block
    b392 - block
    b931 - block
    b822 - block
    b125 - block
    b584 - block
    b457 - block
    b66 - block
    b693 - block
    b461 - block
    b232 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b957 )
    ( on b657 b957 )
    ( on b179 b657 )
    ( on b526 b179 )
    ( on b884 b526 )
    ( on b993 b884 )
    ( on b930 b993 )
    ( on b442 b930 )
    ( on b231 b442 )
    ( on b569 b231 )
    ( on b450 b569 )
    ( on b132 b450 )
    ( on b981 b132 )
    ( on b768 b981 )
    ( on b320 b768 )
    ( on b824 b320 )
    ( on b392 b824 )
    ( on b931 b392 )
    ( on b822 b931 )
    ( on b125 b822 )
    ( on b584 b125 )
    ( on b457 b584 )
    ( on b66 b457 )
    ( on b693 b66 )
    ( on b461 b693 )
    ( on b232 b461 )
    ( clear b232 )
  )
  ( :goal
    ( and
      ( clear b957 )
    )
  )
)
