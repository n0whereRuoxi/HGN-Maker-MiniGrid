( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b875 - block
    b688 - block
    b87 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b875 )
    ( on b688 b875 )
    ( on b87 b688 )
    ( clear b87 )
  )
  ( :goal
    ( and
      ( clear b875 )
    )
  )
)
