( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b393 - block
    b676 - block
    b106 - block
    b3 - block
    b316 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b393 )
    ( on b676 b393 )
    ( on b106 b676 )
    ( on b3 b106 )
    ( on b316 b3 )
    ( clear b316 )
  )
  ( :goal
    ( and
      ( clear b393 )
      ( clear b393 )
      ( clear b393 )
      ( clear b393 )
      ( clear b393 )
    )
  )
)
