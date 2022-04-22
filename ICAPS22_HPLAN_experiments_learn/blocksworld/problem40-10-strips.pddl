( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b49 - block
    b433 - block
    b78 - block
    b863 - block
    b237 - block
    b192 - block
    b588 - block
    b273 - block
    b962 - block
    b766 - block
    b183 - block
    b44 - block
    b816 - block
    b968 - block
    b923 - block
    b27 - block
    b659 - block
    b507 - block
    b779 - block
    b221 - block
    b783 - block
    b964 - block
    b931 - block
    b561 - block
    b403 - block
    b997 - block
    b102 - block
    b409 - block
    b352 - block
    b199 - block
    b545 - block
    b573 - block
    b854 - block
    b667 - block
    b679 - block
    b749 - block
    b594 - block
    b119 - block
    b186 - block
    b80 - block
    b682 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b49 )
    ( on b433 b49 )
    ( on b78 b433 )
    ( on b863 b78 )
    ( on b237 b863 )
    ( on b192 b237 )
    ( on b588 b192 )
    ( on b273 b588 )
    ( on b962 b273 )
    ( on b766 b962 )
    ( on b183 b766 )
    ( on b44 b183 )
    ( on b816 b44 )
    ( on b968 b816 )
    ( on b923 b968 )
    ( on b27 b923 )
    ( on b659 b27 )
    ( on b507 b659 )
    ( on b779 b507 )
    ( on b221 b779 )
    ( on b783 b221 )
    ( on b964 b783 )
    ( on b931 b964 )
    ( on b561 b931 )
    ( on b403 b561 )
    ( on b997 b403 )
    ( on b102 b997 )
    ( on b409 b102 )
    ( on b352 b409 )
    ( on b199 b352 )
    ( on b545 b199 )
    ( on b573 b545 )
    ( on b854 b573 )
    ( on b667 b854 )
    ( on b679 b667 )
    ( on b749 b679 )
    ( on b594 b749 )
    ( on b119 b594 )
    ( on b186 b119 )
    ( on b80 b186 )
    ( on b682 b80 )
    ( clear b682 )
  )
  ( :goal
    ( and
      ( clear b49 )
    )
  )
)
