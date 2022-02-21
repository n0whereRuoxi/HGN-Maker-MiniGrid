( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b356 - block
    b74 - block
    b827 - block
    b789 - block
    b105 - block
    b901 - block
    b552 - block
    b747 - block
    b530 - block
    b131 - block
    b548 - block
    b201 - block
    b656 - block
    b646 - block
    b509 - block
    b495 - block
    b754 - block
    b709 - block
    b672 - block
    b496 - block
    b961 - block
    b246 - block
    b392 - block
    b171 - block
    b772 - block
    b58 - block
    b731 - block
    b591 - block
    b53 - block
    b149 - block
    b933 - block
    b525 - block
    b21 - block
    b290 - block
    b910 - block
    b493 - block
    b816 - block
    b48 - block
    b332 - block
    b729 - block
    b775 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b74 b356 )
    ( on b827 b74 )
    ( on b789 b827 )
    ( on b105 b789 )
    ( on b901 b105 )
    ( on b552 b901 )
    ( on b747 b552 )
    ( on b530 b747 )
    ( on b131 b530 )
    ( on b548 b131 )
    ( on b201 b548 )
    ( on b656 b201 )
    ( on b646 b656 )
    ( on b509 b646 )
    ( on b495 b509 )
    ( on b754 b495 )
    ( on b709 b754 )
    ( on b672 b709 )
    ( on b496 b672 )
    ( on b961 b496 )
    ( on b246 b961 )
    ( on b392 b246 )
    ( on b171 b392 )
    ( on b772 b171 )
    ( on b58 b772 )
    ( on b731 b58 )
    ( on b591 b731 )
    ( on b53 b591 )
    ( on b149 b53 )
    ( on b933 b149 )
    ( on b525 b933 )
    ( on b21 b525 )
    ( on b290 b21 )
    ( on b910 b290 )
    ( on b493 b910 )
    ( on b816 b493 )
    ( on b48 b816 )
    ( on b332 b48 )
    ( on b729 b332 )
    ( on b775 b729 )
    ( clear b775 )
  )
  ( :goal
    ( and
      ( clear b356 )
    )
  )
)
