( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b212 - block
    b475 - block
    b194 - block
    b267 - block
    b290 - block
    b968 - block
    b97 - block
    b268 - block
    b288 - block
    b697 - block
    b16 - block
    b294 - block
    b720 - block
    b337 - block
    b996 - block
    b183 - block
    b779 - block
    b407 - block
    b835 - block
    b808 - block
    b4 - block
    b904 - block
    b956 - block
    b805 - block
    b329 - block
    b545 - block
    b654 - block
    b863 - block
    b544 - block
    b414 - block
    b860 - block
    b833 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b212 )
    ( on b475 b212 )
    ( on b194 b475 )
    ( on b267 b194 )
    ( on b290 b267 )
    ( on b968 b290 )
    ( on b97 b968 )
    ( on b268 b97 )
    ( on b288 b268 )
    ( on b697 b288 )
    ( on b16 b697 )
    ( on b294 b16 )
    ( on b720 b294 )
    ( on b337 b720 )
    ( on b996 b337 )
    ( on b183 b996 )
    ( on b779 b183 )
    ( on b407 b779 )
    ( on b835 b407 )
    ( on b808 b835 )
    ( on b4 b808 )
    ( on b904 b4 )
    ( on b956 b904 )
    ( on b805 b956 )
    ( on b329 b805 )
    ( on b545 b329 )
    ( on b654 b545 )
    ( on b863 b654 )
    ( on b544 b863 )
    ( on b414 b544 )
    ( on b860 b414 )
    ( on b833 b860 )
    ( clear b833 )
  )
  ( :goal
    ( and
      ( clear b212 )
    )
  )
)
