( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b56 - block
    b608 - block
    b730 - block
    b53 - block
    b519 - block
    b243 - block
    b288 - block
    b113 - block
    b511 - block
    b777 - block
    b889 - block
    b857 - block
    b212 - block
    b721 - block
    b595 - block
    b856 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b56 )
    ( on b608 b56 )
    ( on b730 b608 )
    ( on b53 b730 )
    ( on b519 b53 )
    ( on b243 b519 )
    ( on b288 b243 )
    ( on b113 b288 )
    ( on b511 b113 )
    ( on b777 b511 )
    ( on b889 b777 )
    ( on b857 b889 )
    ( on b212 b857 )
    ( on b721 b212 )
    ( on b595 b721 )
    ( on b856 b595 )
    ( clear b856 )
  )
  ( :goal
    ( and
      ( clear b56 )
    )
  )
)
