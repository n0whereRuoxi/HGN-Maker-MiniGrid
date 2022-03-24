( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b969 - block
    b107 - block
    b40 - block
    b337 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b969 )
    ( on b107 b969 )
    ( on b40 b107 )
    ( on b337 b40 )
    ( clear b337 )
  )
  ( :goal
    ( and
      ( clear b969 )
    )
  )
)
