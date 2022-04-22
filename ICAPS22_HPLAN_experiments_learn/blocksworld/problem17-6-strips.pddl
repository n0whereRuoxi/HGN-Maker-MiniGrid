( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b280 - block
    b731 - block
    b333 - block
    b666 - block
    b309 - block
    b723 - block
    b830 - block
    b102 - block
    b884 - block
    b8 - block
    b305 - block
    b376 - block
    b235 - block
    b774 - block
    b983 - block
    b495 - block
    b292 - block
    b152 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b280 )
    ( on b731 b280 )
    ( on b333 b731 )
    ( on b666 b333 )
    ( on b309 b666 )
    ( on b723 b309 )
    ( on b830 b723 )
    ( on b102 b830 )
    ( on b884 b102 )
    ( on b8 b884 )
    ( on b305 b8 )
    ( on b376 b305 )
    ( on b235 b376 )
    ( on b774 b235 )
    ( on b983 b774 )
    ( on b495 b983 )
    ( on b292 b495 )
    ( on b152 b292 )
    ( clear b152 )
  )
  ( :goal
    ( and
      ( clear b280 )
    )
  )
)
