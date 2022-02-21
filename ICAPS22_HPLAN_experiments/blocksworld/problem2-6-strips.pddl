( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b789 - block
    b694 - block
    b480 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b789 )
    ( on b694 b789 )
    ( on b480 b694 )
    ( clear b480 )
  )
  ( :goal
    ( and
      ( clear b789 )
    )
  )
)
