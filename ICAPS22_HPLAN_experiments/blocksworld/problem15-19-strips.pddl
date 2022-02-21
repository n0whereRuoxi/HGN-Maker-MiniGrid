( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b6 - block
    b966 - block
    b211 - block
    b236 - block
    b963 - block
    b477 - block
    b567 - block
    b798 - block
    b830 - block
    b692 - block
    b976 - block
    b349 - block
    b538 - block
    b48 - block
    b306 - block
    b837 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b6 )
    ( on b966 b6 )
    ( on b211 b966 )
    ( on b236 b211 )
    ( on b963 b236 )
    ( on b477 b963 )
    ( on b567 b477 )
    ( on b798 b567 )
    ( on b830 b798 )
    ( on b692 b830 )
    ( on b976 b692 )
    ( on b349 b976 )
    ( on b538 b349 )
    ( on b48 b538 )
    ( on b306 b48 )
    ( on b837 b306 )
    ( clear b837 )
  )
  ( :goal
    ( and
      ( clear b6 )
    )
  )
)
