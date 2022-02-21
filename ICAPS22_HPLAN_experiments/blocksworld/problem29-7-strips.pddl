( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b178 - block
    b164 - block
    b233 - block
    b408 - block
    b142 - block
    b569 - block
    b709 - block
    b437 - block
    b80 - block
    b289 - block
    b25 - block
    b691 - block
    b78 - block
    b169 - block
    b280 - block
    b451 - block
    b538 - block
    b869 - block
    b996 - block
    b254 - block
    b90 - block
    b656 - block
    b746 - block
    b45 - block
    b820 - block
    b526 - block
    b157 - block
    b821 - block
    b331 - block
    b476 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b178 )
    ( on b164 b178 )
    ( on b233 b164 )
    ( on b408 b233 )
    ( on b142 b408 )
    ( on b569 b142 )
    ( on b709 b569 )
    ( on b437 b709 )
    ( on b80 b437 )
    ( on b289 b80 )
    ( on b25 b289 )
    ( on b691 b25 )
    ( on b78 b691 )
    ( on b169 b78 )
    ( on b280 b169 )
    ( on b451 b280 )
    ( on b538 b451 )
    ( on b869 b538 )
    ( on b996 b869 )
    ( on b254 b996 )
    ( on b90 b254 )
    ( on b656 b90 )
    ( on b746 b656 )
    ( on b45 b746 )
    ( on b820 b45 )
    ( on b526 b820 )
    ( on b157 b526 )
    ( on b821 b157 )
    ( on b331 b821 )
    ( on b476 b331 )
    ( clear b476 )
  )
  ( :goal
    ( and
      ( clear b178 )
    )
  )
)
