( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b50 - block
    b494 - block
    b41 - block
    b633 - block
    b433 - block
    b683 - block
    b278 - block
    b922 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b50 )
    ( on b494 b50 )
    ( on b41 b494 )
    ( on b633 b41 )
    ( on b433 b633 )
    ( on b683 b433 )
    ( on b278 b683 )
    ( on b922 b278 )
    ( clear b922 )
  )
  ( :goal
    ( and
      ( clear b50 )
    )
  )
)
