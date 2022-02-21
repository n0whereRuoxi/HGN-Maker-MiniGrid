( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b872 - block
    b202 - block
    b834 - block
    b172 - block
    b293 - block
    b666 - block
    b531 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b872 )
    ( on b202 b872 )
    ( on b834 b202 )
    ( on b172 b834 )
    ( on b293 b172 )
    ( on b666 b293 )
    ( on b531 b666 )
    ( clear b531 )
  )
  ( :goal
    ( and
      ( clear b872 )
    )
  )
)
