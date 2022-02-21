( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b344 - block
    b235 - block
    b337 - block
    b575 - block
    b931 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b344 )
    ( on b235 b344 )
    ( on b337 b235 )
    ( on b575 b337 )
    ( on b931 b575 )
    ( clear b931 )
  )
  ( :goal
    ( and
      ( clear b344 )
      ( clear b344 )
      ( clear b344 )
      ( clear b344 )
      ( clear b344 )
    )
  )
)
