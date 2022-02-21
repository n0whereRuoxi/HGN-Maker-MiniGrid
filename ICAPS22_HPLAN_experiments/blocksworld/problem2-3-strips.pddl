( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b658 - block
    b96 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b658 b798 )
    ( on b96 b658 )
    ( clear b96 )
  )
  ( :goal
    ( and
      ( clear b798 )
    )
  )
)
