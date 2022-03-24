( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b978 - block
    b188 - block
    b663 - block
    b227 - block
    b534 - block
    b455 - block
    b744 - block
    b361 - block
    b731 - block
    b980 - block
    b136 - block
    b70 - block
    b221 - block
    b349 - block
    b92 - block
    b531 - block
    b956 - block
    b922 - block
    b97 - block
    b265 - block
    b648 - block
    b953 - block
    b482 - block
    b427 - block
    b614 - block
    b658 - block
    b347 - block
    b935 - block
    b192 - block
    b591 - block
    b795 - block
    b556 - block
    b5 - block
    b794 - block
    b394 - block
    b694 - block
    b579 - block
    b400 - block
    b26 - block
    b421 - block
    b281 - block
    b800 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b978 )
    ( on b188 b978 )
    ( on b663 b188 )
    ( on b227 b663 )
    ( on b534 b227 )
    ( on b455 b534 )
    ( on b744 b455 )
    ( on b361 b744 )
    ( on b731 b361 )
    ( on b980 b731 )
    ( on b136 b980 )
    ( on b70 b136 )
    ( on b221 b70 )
    ( on b349 b221 )
    ( on b92 b349 )
    ( on b531 b92 )
    ( on b956 b531 )
    ( on b922 b956 )
    ( on b97 b922 )
    ( on b265 b97 )
    ( on b648 b265 )
    ( on b953 b648 )
    ( on b482 b953 )
    ( on b427 b482 )
    ( on b614 b427 )
    ( on b658 b614 )
    ( on b347 b658 )
    ( on b935 b347 )
    ( on b192 b935 )
    ( on b591 b192 )
    ( on b795 b591 )
    ( on b556 b795 )
    ( on b5 b556 )
    ( on b794 b5 )
    ( on b394 b794 )
    ( on b694 b394 )
    ( on b579 b694 )
    ( on b400 b579 )
    ( on b26 b400 )
    ( on b421 b26 )
    ( on b281 b421 )
    ( on b800 b281 )
    ( clear b800 )
  )
  ( :goal
    ( and
      ( clear b978 )
    )
  )
)
