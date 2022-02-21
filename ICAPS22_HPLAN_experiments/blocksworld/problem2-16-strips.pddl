( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b639 - block
    b920 - block
    b855 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b639 )
    ( on b920 b639 )
    ( on b855 b920 )
    ( clear b855 )
  )
  ( :goal
    ( and
      ( clear b639 )
      ( clear b639 )
      ( clear b639 )
    )
  )
)
