( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b769 - block
    b193 - block
    b501 - block
    b504 - block
    b738 - block
    b957 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b769 )
    ( on b193 b769 )
    ( on b501 b193 )
    ( on b504 b501 )
    ( on b738 b504 )
    ( on b957 b738 )
    ( on b512 b957 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b769 )
    )
  )
)
