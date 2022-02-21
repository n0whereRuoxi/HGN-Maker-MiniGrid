( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b23 - block
    b483 - block
    b154 - block
    b869 - block
    b249 - block
    b588 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b23 )
    ( on b483 b23 )
    ( on b154 b483 )
    ( on b869 b154 )
    ( on b249 b869 )
    ( on b588 b249 )
    ( on b801 b588 )
    ( clear b801 )
  )
  ( :goal
    ( and
      ( clear b23 )
    )
  )
)
