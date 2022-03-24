( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b94 - block
    b58 - block
    b592 - block
    b397 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b94 )
    ( on b58 b94 )
    ( on b592 b58 )
    ( on b397 b592 )
    ( clear b397 )
  )
  ( :goal
    ( and
      ( clear b94 )
    )
  )
)
