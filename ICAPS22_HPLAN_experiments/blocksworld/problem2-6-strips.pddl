( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b236 - block
    b307 - block
    b459 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b236 )
    ( on b307 b236 )
    ( on b459 b307 )
    ( clear b459 )
  )
  ( :goal
    ( and
      ( clear b236 )
    )
  )
)
