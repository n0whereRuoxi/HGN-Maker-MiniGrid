( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b149 - block
    b367 - block
    b810 - block
    b98 - block
    b711 - block
    b628 - block
    b647 - block
    b372 - block
    b161 - block
    b486 - block
    b111 - block
    b328 - block
    b337 - block
    b343 - block
    b190 - block
    b688 - block
    b563 - block
    b593 - block
    b490 - block
    b664 - block
    b84 - block
    b512 - block
    b96 - block
    b888 - block
    b643 - block
    b440 - block
    b301 - block
    b911 - block
    b706 - block
    b587 - block
    b287 - block
    b355 - block
    b153 - block
    b531 - block
    b281 - block
    b847 - block
    b850 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b149 )
    ( on b367 b149 )
    ( on b810 b367 )
    ( on b98 b810 )
    ( on b711 b98 )
    ( on b628 b711 )
    ( on b647 b628 )
    ( on b372 b647 )
    ( on b161 b372 )
    ( on b486 b161 )
    ( on b111 b486 )
    ( on b328 b111 )
    ( on b337 b328 )
    ( on b343 b337 )
    ( on b190 b343 )
    ( on b688 b190 )
    ( on b563 b688 )
    ( on b593 b563 )
    ( on b490 b593 )
    ( on b664 b490 )
    ( on b84 b664 )
    ( on b512 b84 )
    ( on b96 b512 )
    ( on b888 b96 )
    ( on b643 b888 )
    ( on b440 b643 )
    ( on b301 b440 )
    ( on b911 b301 )
    ( on b706 b911 )
    ( on b587 b706 )
    ( on b287 b587 )
    ( on b355 b287 )
    ( on b153 b355 )
    ( on b531 b153 )
    ( on b281 b531 )
    ( on b847 b281 )
    ( on b850 b847 )
    ( clear b850 )
  )
  ( :goal
    ( and
      ( clear b149 )
    )
  )
)
