( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b646 - block
    b291 - block
    b747 - block
    b191 - block
    b23 - block
    b551 - block
    b421 - block
    b529 - block
    b176 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b646 b226 )
    ( on b291 b646 )
    ( on b747 b291 )
    ( on b191 b747 )
    ( on b23 b191 )
    ( on b551 b23 )
    ( on b421 b551 )
    ( on b529 b421 )
    ( on b176 b529 )
    ( clear b176 )
  )
  ( :goal
    ( and
      ( clear b226 )
    )
  )
)
