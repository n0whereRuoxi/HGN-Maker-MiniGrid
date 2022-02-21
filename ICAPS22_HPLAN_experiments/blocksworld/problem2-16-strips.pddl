( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b134 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b134 b226 )
    ( on b779 b134 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b226 )
    )
  )
)
