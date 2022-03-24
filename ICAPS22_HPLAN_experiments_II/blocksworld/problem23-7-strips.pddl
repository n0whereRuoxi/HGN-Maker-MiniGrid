( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b290 - block
    b512 - block
    b159 - block
    b913 - block
    b54 - block
    b413 - block
    b108 - block
    b98 - block
    b168 - block
    b851 - block
    b558 - block
    b838 - block
    b15 - block
    b339 - block
    b959 - block
    b256 - block
    b97 - block
    b715 - block
    b589 - block
    b37 - block
    b518 - block
    b34 - block
    b457 - block
    b234 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b290 )
    ( on b512 b290 )
    ( on b159 b512 )
    ( on b913 b159 )
    ( on b54 b913 )
    ( on b413 b54 )
    ( on b108 b413 )
    ( on b98 b108 )
    ( on b168 b98 )
    ( on b851 b168 )
    ( on b558 b851 )
    ( on b838 b558 )
    ( on b15 b838 )
    ( on b339 b15 )
    ( on b959 b339 )
    ( on b256 b959 )
    ( on b97 b256 )
    ( on b715 b97 )
    ( on b589 b715 )
    ( on b37 b589 )
    ( on b518 b37 )
    ( on b34 b518 )
    ( on b457 b34 )
    ( on b234 b457 )
    ( clear b234 )
  )
  ( :goal
    ( and
      ( clear b290 )
    )
  )
)
