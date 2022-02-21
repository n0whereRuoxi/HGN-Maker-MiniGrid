( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b544 - block
    b638 - block
    b462 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b544 )
    ( on b638 b544 )
    ( on b462 b638 )
    ( clear b462 )
  )
  ( :goal
    ( and
      ( clear b544 )
    )
  )
)
