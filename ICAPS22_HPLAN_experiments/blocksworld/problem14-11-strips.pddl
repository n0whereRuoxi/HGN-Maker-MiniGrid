( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b20 - block
    b291 - block
    b990 - block
    b189 - block
    b231 - block
    b335 - block
    b685 - block
    b632 - block
    b336 - block
    b936 - block
    b902 - block
    b63 - block
    b34 - block
    b484 - block
    b915 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b20 )
    ( on b291 b20 )
    ( on b990 b291 )
    ( on b189 b990 )
    ( on b231 b189 )
    ( on b335 b231 )
    ( on b685 b335 )
    ( on b632 b685 )
    ( on b336 b632 )
    ( on b936 b336 )
    ( on b902 b936 )
    ( on b63 b902 )
    ( on b34 b63 )
    ( on b484 b34 )
    ( on b915 b484 )
    ( clear b915 )
  )
  ( :goal
    ( and
      ( clear b20 )
    )
  )
)
