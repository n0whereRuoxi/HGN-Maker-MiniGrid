( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b499 - block
    b354 - block
    b496 - block
    b894 - block
    b704 - block
    b639 - block
    b597 - block
    b915 - block
    b558 - block
    b287 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b499 )
    ( on b354 b499 )
    ( on b496 b354 )
    ( on b894 b496 )
    ( on b704 b894 )
    ( on b639 b704 )
    ( on b597 b639 )
    ( on b915 b597 )
    ( on b558 b915 )
    ( on b287 b558 )
    ( clear b287 )
  )
  ( :goal
    ( and
      ( clear b499 )
    )
  )
)
