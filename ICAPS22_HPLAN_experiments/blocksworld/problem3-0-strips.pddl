( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b415 - block
    b892 - block
    b199 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b415 )
    ( on b892 b415 )
    ( on b199 b892 )
    ( on b391 b199 )
    ( clear b391 )
  )
  ( :goal
    ( and
      ( clear b415 )
    )
  )
)
