( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b825 - block
    b85 - block
    b898 - block
    b540 - block
    b224 - block
    b633 - block
    b630 - block
    b915 - block
    b235 - block
    b358 - block
    b590 - block
    b787 - block
    b881 - block
    b372 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b825 )
    ( on b85 b825 )
    ( on b898 b85 )
    ( on b540 b898 )
    ( on b224 b540 )
    ( on b633 b224 )
    ( on b630 b633 )
    ( on b915 b630 )
    ( on b235 b915 )
    ( on b358 b235 )
    ( on b590 b358 )
    ( on b787 b590 )
    ( on b881 b787 )
    ( on b372 b881 )
    ( clear b372 )
  )
  ( :goal
    ( and
      ( clear b825 )
    )
  )
)
