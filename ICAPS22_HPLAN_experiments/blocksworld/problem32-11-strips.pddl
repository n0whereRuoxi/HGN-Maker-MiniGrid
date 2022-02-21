( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b799 - block
    b18 - block
    b597 - block
    b374 - block
    b877 - block
    b29 - block
    b288 - block
    b60 - block
    b574 - block
    b91 - block
    b299 - block
    b767 - block
    b240 - block
    b203 - block
    b588 - block
    b646 - block
    b502 - block
    b338 - block
    b343 - block
    b399 - block
    b332 - block
    b325 - block
    b570 - block
    b357 - block
    b604 - block
    b854 - block
    b896 - block
    b512 - block
    b2 - block
    b921 - block
    b267 - block
    b107 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b799 )
    ( on b18 b799 )
    ( on b597 b18 )
    ( on b374 b597 )
    ( on b877 b374 )
    ( on b29 b877 )
    ( on b288 b29 )
    ( on b60 b288 )
    ( on b574 b60 )
    ( on b91 b574 )
    ( on b299 b91 )
    ( on b767 b299 )
    ( on b240 b767 )
    ( on b203 b240 )
    ( on b588 b203 )
    ( on b646 b588 )
    ( on b502 b646 )
    ( on b338 b502 )
    ( on b343 b338 )
    ( on b399 b343 )
    ( on b332 b399 )
    ( on b325 b332 )
    ( on b570 b325 )
    ( on b357 b570 )
    ( on b604 b357 )
    ( on b854 b604 )
    ( on b896 b854 )
    ( on b512 b896 )
    ( on b2 b512 )
    ( on b921 b2 )
    ( on b267 b921 )
    ( on b107 b267 )
    ( on b137 b107 )
    ( clear b137 )
  )
  ( :goal
    ( and
      ( clear b799 )
    )
  )
)
