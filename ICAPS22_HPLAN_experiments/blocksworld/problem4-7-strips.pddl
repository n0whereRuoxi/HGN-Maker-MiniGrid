( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b587 - block
    b639 - block
    b810 - block
    b210 - block
    b180 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b587 )
    ( on b639 b587 )
    ( on b810 b639 )
    ( on b210 b810 )
    ( on b180 b210 )
    ( clear b180 )
  )
  ( :goal
    ( and
      ( clear b587 )
    )
  )
)
