( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b550 - block
    b662 - block
    b536 - block
    b30 - block
    b367 - block
    b307 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b550 )
    ( on b662 b550 )
    ( on b536 b662 )
    ( on b30 b536 )
    ( on b367 b30 )
    ( on b307 b367 )
    ( clear b307 )
  )
  ( :goal
    ( and
      ( clear b550 )
    )
  )
)
