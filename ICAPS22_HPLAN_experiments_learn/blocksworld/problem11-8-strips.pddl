( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b482 - block
    b65 - block
    b780 - block
    b270 - block
    b523 - block
    b253 - block
    b841 - block
    b669 - block
    b62 - block
    b825 - block
    b115 - block
    b111 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b482 )
    ( on b65 b482 )
    ( on b780 b65 )
    ( on b270 b780 )
    ( on b523 b270 )
    ( on b253 b523 )
    ( on b841 b253 )
    ( on b669 b841 )
    ( on b62 b669 )
    ( on b825 b62 )
    ( on b115 b825 )
    ( on b111 b115 )
    ( clear b111 )
  )
  ( :goal
    ( and
      ( clear b482 )
    )
  )
)
