( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b681 - block
    b605 - block
    b149 - block
    b656 - block
    b244 - block
    b901 - block
    b267 - block
    b147 - block
    b670 - block
    b666 - block
    b726 - block
    b835 - block
    b377 - block
    b195 - block
    b433 - block
    b426 - block
    b55 - block
    b435 - block
    b447 - block
    b484 - block
    b962 - block
    b34 - block
    b238 - block
    b287 - block
    b842 - block
    b739 - block
    b596 - block
    b602 - block
    b434 - block
    b502 - block
    b23 - block
    b481 - block
    b388 - block
    b672 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b681 )
    ( on b605 b681 )
    ( on b149 b605 )
    ( on b656 b149 )
    ( on b244 b656 )
    ( on b901 b244 )
    ( on b267 b901 )
    ( on b147 b267 )
    ( on b670 b147 )
    ( on b666 b670 )
    ( on b726 b666 )
    ( on b835 b726 )
    ( on b377 b835 )
    ( on b195 b377 )
    ( on b433 b195 )
    ( on b426 b433 )
    ( on b55 b426 )
    ( on b435 b55 )
    ( on b447 b435 )
    ( on b484 b447 )
    ( on b962 b484 )
    ( on b34 b962 )
    ( on b238 b34 )
    ( on b287 b238 )
    ( on b842 b287 )
    ( on b739 b842 )
    ( on b596 b739 )
    ( on b602 b596 )
    ( on b434 b602 )
    ( on b502 b434 )
    ( on b23 b502 )
    ( on b481 b23 )
    ( on b388 b481 )
    ( on b672 b388 )
    ( clear b672 )
  )
  ( :goal
    ( and
      ( clear b681 )
    )
  )
)
