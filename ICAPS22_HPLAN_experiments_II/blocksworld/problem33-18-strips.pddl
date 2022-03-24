( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b805 - block
    b85 - block
    b283 - block
    b871 - block
    b841 - block
    b35 - block
    b352 - block
    b782 - block
    b638 - block
    b817 - block
    b443 - block
    b743 - block
    b489 - block
    b317 - block
    b159 - block
    b341 - block
    b740 - block
    b950 - block
    b613 - block
    b482 - block
    b524 - block
    b968 - block
    b252 - block
    b457 - block
    b906 - block
    b814 - block
    b819 - block
    b201 - block
    b672 - block
    b68 - block
    b57 - block
    b667 - block
    b95 - block
    b835 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b805 )
    ( on b85 b805 )
    ( on b283 b85 )
    ( on b871 b283 )
    ( on b841 b871 )
    ( on b35 b841 )
    ( on b352 b35 )
    ( on b782 b352 )
    ( on b638 b782 )
    ( on b817 b638 )
    ( on b443 b817 )
    ( on b743 b443 )
    ( on b489 b743 )
    ( on b317 b489 )
    ( on b159 b317 )
    ( on b341 b159 )
    ( on b740 b341 )
    ( on b950 b740 )
    ( on b613 b950 )
    ( on b482 b613 )
    ( on b524 b482 )
    ( on b968 b524 )
    ( on b252 b968 )
    ( on b457 b252 )
    ( on b906 b457 )
    ( on b814 b906 )
    ( on b819 b814 )
    ( on b201 b819 )
    ( on b672 b201 )
    ( on b68 b672 )
    ( on b57 b68 )
    ( on b667 b57 )
    ( on b95 b667 )
    ( on b835 b95 )
    ( clear b835 )
  )
  ( :goal
    ( and
      ( clear b805 )
    )
  )
)
