( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b24 - block
    b550 - block
    b654 - block
    b392 - block
    b974 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b24 )
    ( on b550 b24 )
    ( on b654 b550 )
    ( on b392 b654 )
    ( on b974 b392 )
    ( on b721 b974 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b24 )
    )
  )
)
