( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b553 - block
    b943 - block
    b445 - block
    b457 - block
    b903 - block
    b364 - block
    b744 - block
    b677 - block
    b120 - block
    b183 - block
    b118 - block
    b512 - block
    b252 - block
    b562 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b553 )
    ( on b943 b553 )
    ( on b445 b943 )
    ( on b457 b445 )
    ( on b903 b457 )
    ( on b364 b903 )
    ( on b744 b364 )
    ( on b677 b744 )
    ( on b120 b677 )
    ( on b183 b120 )
    ( on b118 b183 )
    ( on b512 b118 )
    ( on b252 b512 )
    ( on b562 b252 )
    ( clear b562 )
  )
  ( :goal
    ( and
      ( clear b553 )
    )
  )
)
