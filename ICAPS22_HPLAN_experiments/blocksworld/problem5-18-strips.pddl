( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b251 - block
    b639 - block
    b360 - block
    b964 - block
    b635 - block
    b71 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b251 )
    ( on b639 b251 )
    ( on b360 b639 )
    ( on b964 b360 )
    ( on b635 b964 )
    ( on b71 b635 )
    ( clear b71 )
  )
  ( :goal
    ( and
      ( clear b251 )
    )
  )
)
