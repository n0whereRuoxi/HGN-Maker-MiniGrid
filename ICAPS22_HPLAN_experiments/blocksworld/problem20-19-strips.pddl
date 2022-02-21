( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b824 - block
    b80 - block
    b62 - block
    b702 - block
    b731 - block
    b588 - block
    b448 - block
    b129 - block
    b456 - block
    b867 - block
    b476 - block
    b171 - block
    b656 - block
    b143 - block
    b963 - block
    b192 - block
    b220 - block
    b127 - block
    b35 - block
    b686 - block
    b754 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b824 )
    ( on b80 b824 )
    ( on b62 b80 )
    ( on b702 b62 )
    ( on b731 b702 )
    ( on b588 b731 )
    ( on b448 b588 )
    ( on b129 b448 )
    ( on b456 b129 )
    ( on b867 b456 )
    ( on b476 b867 )
    ( on b171 b476 )
    ( on b656 b171 )
    ( on b143 b656 )
    ( on b963 b143 )
    ( on b192 b963 )
    ( on b220 b192 )
    ( on b127 b220 )
    ( on b35 b127 )
    ( on b686 b35 )
    ( on b754 b686 )
    ( clear b754 )
  )
  ( :goal
    ( and
      ( clear b824 )
    )
  )
)
