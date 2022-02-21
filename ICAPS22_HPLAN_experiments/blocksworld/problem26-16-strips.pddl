( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b102 - block
    b662 - block
    b171 - block
    b946 - block
    b159 - block
    b5 - block
    b788 - block
    b70 - block
    b974 - block
    b956 - block
    b303 - block
    b997 - block
    b137 - block
    b264 - block
    b164 - block
    b601 - block
    b423 - block
    b406 - block
    b98 - block
    b457 - block
    b534 - block
    b497 - block
    b236 - block
    b761 - block
    b763 - block
    b464 - block
    b481 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b102 )
    ( on b662 b102 )
    ( on b171 b662 )
    ( on b946 b171 )
    ( on b159 b946 )
    ( on b5 b159 )
    ( on b788 b5 )
    ( on b70 b788 )
    ( on b974 b70 )
    ( on b956 b974 )
    ( on b303 b956 )
    ( on b997 b303 )
    ( on b137 b997 )
    ( on b264 b137 )
    ( on b164 b264 )
    ( on b601 b164 )
    ( on b423 b601 )
    ( on b406 b423 )
    ( on b98 b406 )
    ( on b457 b98 )
    ( on b534 b457 )
    ( on b497 b534 )
    ( on b236 b497 )
    ( on b761 b236 )
    ( on b763 b761 )
    ( on b464 b763 )
    ( on b481 b464 )
    ( clear b481 )
  )
  ( :goal
    ( and
      ( clear b102 )
    )
  )
)
