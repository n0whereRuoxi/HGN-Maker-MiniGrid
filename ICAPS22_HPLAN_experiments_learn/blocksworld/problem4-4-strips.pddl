( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b766 - block
    b157 - block
    b240 - block
    b925 - block
    b243 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b766 )
    ( on b157 b766 )
    ( on b240 b157 )
    ( on b925 b240 )
    ( on b243 b925 )
    ( clear b243 )
  )
  ( :goal
    ( and
      ( clear b766 )
    )
  )
)
