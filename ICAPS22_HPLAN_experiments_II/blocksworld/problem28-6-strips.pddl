( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b896 - block
    b968 - block
    b746 - block
    b511 - block
    b790 - block
    b120 - block
    b221 - block
    b320 - block
    b714 - block
    b379 - block
    b565 - block
    b819 - block
    b133 - block
    b236 - block
    b368 - block
    b911 - block
    b864 - block
    b910 - block
    b306 - block
    b537 - block
    b378 - block
    b831 - block
    b424 - block
    b491 - block
    b926 - block
    b442 - block
    b829 - block
    b540 - block
    b289 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b896 )
    ( on b968 b896 )
    ( on b746 b968 )
    ( on b511 b746 )
    ( on b790 b511 )
    ( on b120 b790 )
    ( on b221 b120 )
    ( on b320 b221 )
    ( on b714 b320 )
    ( on b379 b714 )
    ( on b565 b379 )
    ( on b819 b565 )
    ( on b133 b819 )
    ( on b236 b133 )
    ( on b368 b236 )
    ( on b911 b368 )
    ( on b864 b911 )
    ( on b910 b864 )
    ( on b306 b910 )
    ( on b537 b306 )
    ( on b378 b537 )
    ( on b831 b378 )
    ( on b424 b831 )
    ( on b491 b424 )
    ( on b926 b491 )
    ( on b442 b926 )
    ( on b829 b442 )
    ( on b540 b829 )
    ( on b289 b540 )
    ( clear b289 )
  )
  ( :goal
    ( and
      ( clear b896 )
    )
  )
)
