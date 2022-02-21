( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b333 - block
    b510 - block
    b461 - block
    b465 - block
    b232 - block
    b282 - block
    b152 - block
    b436 - block
    b968 - block
    b650 - block
    b885 - block
    b380 - block
    b454 - block
    b925 - block
    b265 - block
    b791 - block
    b824 - block
    b315 - block
    b389 - block
    b865 - block
    b271 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b333 )
    ( on b510 b333 )
    ( on b461 b510 )
    ( on b465 b461 )
    ( on b232 b465 )
    ( on b282 b232 )
    ( on b152 b282 )
    ( on b436 b152 )
    ( on b968 b436 )
    ( on b650 b968 )
    ( on b885 b650 )
    ( on b380 b885 )
    ( on b454 b380 )
    ( on b925 b454 )
    ( on b265 b925 )
    ( on b791 b265 )
    ( on b824 b791 )
    ( on b315 b824 )
    ( on b389 b315 )
    ( on b865 b389 )
    ( on b271 b865 )
    ( on b692 b271 )
    ( clear b692 )
  )
  ( :goal
    ( and
      ( clear b333 )
    )
  )
)
