( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b119 - block
    b672 - block
    b95 - block
    b152 - block
    b199 - block
    b498 - block
    b631 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b119 )
    ( on b672 b119 )
    ( on b95 b672 )
    ( on b152 b95 )
    ( on b199 b152 )
    ( on b498 b199 )
    ( on b631 b498 )
    ( clear b631 )
  )
  ( :goal
    ( and
      ( clear b119 )
    )
  )
)
