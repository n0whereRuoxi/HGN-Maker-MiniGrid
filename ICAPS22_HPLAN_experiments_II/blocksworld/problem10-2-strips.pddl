( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b750 - block
    b444 - block
    b441 - block
    b579 - block
    b94 - block
    b609 - block
    b518 - block
    b915 - block
    b277 - block
    b468 - block
    b434 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b750 )
    ( on b444 b750 )
    ( on b441 b444 )
    ( on b579 b441 )
    ( on b94 b579 )
    ( on b609 b94 )
    ( on b518 b609 )
    ( on b915 b518 )
    ( on b277 b915 )
    ( on b468 b277 )
    ( on b434 b468 )
    ( clear b434 )
  )
  ( :goal
    ( and
      ( clear b750 )
    )
  )
)
