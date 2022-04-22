( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b161 - block
    b391 - block
    b910 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b161 )
    ( on b391 b161 )
    ( on b910 b391 )
    ( clear b910 )
  )
  ( :goal
    ( and
      ( clear b161 )
    )
  )
)
