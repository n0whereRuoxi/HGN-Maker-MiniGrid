( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b166 - block
    b94 - block
    b73 - block
    b496 - block
    b924 - block
    b491 - block
    b700 - block
    b199 - block
    b250 - block
    b67 - block
    b678 - block
    b488 - block
    b755 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b166 )
    ( on b94 b166 )
    ( on b73 b94 )
    ( on b496 b73 )
    ( on b924 b496 )
    ( on b491 b924 )
    ( on b700 b491 )
    ( on b199 b700 )
    ( on b250 b199 )
    ( on b67 b250 )
    ( on b678 b67 )
    ( on b488 b678 )
    ( on b755 b488 )
    ( clear b755 )
  )
  ( :goal
    ( and
      ( clear b166 )
    )
  )
)
