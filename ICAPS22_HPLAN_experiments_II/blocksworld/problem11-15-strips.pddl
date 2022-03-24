( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b633 - block
    b103 - block
    b488 - block
    b62 - block
    b927 - block
    b741 - block
    b440 - block
    b291 - block
    b241 - block
    b120 - block
    b81 - block
    b196 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b633 )
    ( on b103 b633 )
    ( on b488 b103 )
    ( on b62 b488 )
    ( on b927 b62 )
    ( on b741 b927 )
    ( on b440 b741 )
    ( on b291 b440 )
    ( on b241 b291 )
    ( on b120 b241 )
    ( on b81 b120 )
    ( on b196 b81 )
    ( clear b196 )
  )
  ( :goal
    ( and
      ( clear b633 )
    )
  )
)
