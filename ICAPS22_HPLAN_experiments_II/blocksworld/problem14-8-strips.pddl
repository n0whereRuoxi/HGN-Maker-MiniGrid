( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b808 - block
    b48 - block
    b145 - block
    b246 - block
    b138 - block
    b994 - block
    b267 - block
    b606 - block
    b619 - block
    b351 - block
    b96 - block
    b556 - block
    b603 - block
    b798 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b808 b466 )
    ( on b48 b808 )
    ( on b145 b48 )
    ( on b246 b145 )
    ( on b138 b246 )
    ( on b994 b138 )
    ( on b267 b994 )
    ( on b606 b267 )
    ( on b619 b606 )
    ( on b351 b619 )
    ( on b96 b351 )
    ( on b556 b96 )
    ( on b603 b556 )
    ( on b798 b603 )
    ( clear b798 )
  )
  ( :goal
    ( and
      ( clear b466 )
    )
  )
)
