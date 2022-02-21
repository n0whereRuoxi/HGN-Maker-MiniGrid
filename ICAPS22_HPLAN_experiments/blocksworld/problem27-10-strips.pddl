( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b292 - block
    b147 - block
    b103 - block
    b816 - block
    b917 - block
    b953 - block
    b427 - block
    b101 - block
    b347 - block
    b936 - block
    b240 - block
    b232 - block
    b962 - block
    b731 - block
    b758 - block
    b6 - block
    b642 - block
    b763 - block
    b925 - block
    b352 - block
    b33 - block
    b959 - block
    b645 - block
    b17 - block
    b756 - block
    b12 - block
    b994 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b292 )
    ( on b147 b292 )
    ( on b103 b147 )
    ( on b816 b103 )
    ( on b917 b816 )
    ( on b953 b917 )
    ( on b427 b953 )
    ( on b101 b427 )
    ( on b347 b101 )
    ( on b936 b347 )
    ( on b240 b936 )
    ( on b232 b240 )
    ( on b962 b232 )
    ( on b731 b962 )
    ( on b758 b731 )
    ( on b6 b758 )
    ( on b642 b6 )
    ( on b763 b642 )
    ( on b925 b763 )
    ( on b352 b925 )
    ( on b33 b352 )
    ( on b959 b33 )
    ( on b645 b959 )
    ( on b17 b645 )
    ( on b756 b17 )
    ( on b12 b756 )
    ( on b994 b12 )
    ( on b473 b994 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b292 )
    )
  )
)
