( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b573 - block
    b572 - block
    b693 - block
    b884 - block
    b22 - block
    b65 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b573 )
    ( on b572 b573 )
    ( on b693 b572 )
    ( on b884 b693 )
    ( on b22 b884 )
    ( on b65 b22 )
    ( clear b65 )
  )
  ( :goal
    ( and
      ( clear b573 )
      ( clear b573 )
      ( clear b573 )
      ( clear b573 )
      ( clear b573 )
      ( clear b573 )
    )
  )
)
