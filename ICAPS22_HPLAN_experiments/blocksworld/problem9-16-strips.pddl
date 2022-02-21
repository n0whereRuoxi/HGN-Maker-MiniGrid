( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b861 - block
    b681 - block
    b904 - block
    b355 - block
    b180 - block
    b435 - block
    b321 - block
    b194 - block
    b326 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b861 )
    ( on b681 b861 )
    ( on b904 b681 )
    ( on b355 b904 )
    ( on b180 b355 )
    ( on b435 b180 )
    ( on b321 b435 )
    ( on b194 b321 )
    ( on b326 b194 )
    ( on b543 b326 )
    ( clear b543 )
  )
  ( :goal
    ( and
      ( clear b861 )
    )
  )
)
