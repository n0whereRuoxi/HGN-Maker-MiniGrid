( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b125 - block
    b240 - block
    b927 - block
    b768 - block
    b451 - block
    b56 - block
    b309 - block
    b119 - block
    b208 - block
    b188 - block
    b293 - block
    b801 - block
    b552 - block
    b306 - block
    b514 - block
    b103 - block
    b423 - block
    b159 - block
    b963 - block
    b677 - block
    b497 - block
    b613 - block
    b183 - block
    b667 - block
    b932 - block
    b36 - block
    b372 - block
    b824 - block
    b280 - block
    b771 - block
    b100 - block
    b901 - block
    b455 - block
    b608 - block
    b515 - block
    b815 - block
    b716 - block
    b214 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b125 )
    ( on b240 b125 )
    ( on b927 b240 )
    ( on b768 b927 )
    ( on b451 b768 )
    ( on b56 b451 )
    ( on b309 b56 )
    ( on b119 b309 )
    ( on b208 b119 )
    ( on b188 b208 )
    ( on b293 b188 )
    ( on b801 b293 )
    ( on b552 b801 )
    ( on b306 b552 )
    ( on b514 b306 )
    ( on b103 b514 )
    ( on b423 b103 )
    ( on b159 b423 )
    ( on b963 b159 )
    ( on b677 b963 )
    ( on b497 b677 )
    ( on b613 b497 )
    ( on b183 b613 )
    ( on b667 b183 )
    ( on b932 b667 )
    ( on b36 b932 )
    ( on b372 b36 )
    ( on b824 b372 )
    ( on b280 b824 )
    ( on b771 b280 )
    ( on b100 b771 )
    ( on b901 b100 )
    ( on b455 b901 )
    ( on b608 b455 )
    ( on b515 b608 )
    ( on b815 b515 )
    ( on b716 b815 )
    ( on b214 b716 )
    ( clear b214 )
  )
  ( :goal
    ( and
      ( clear b125 )
    )
  )
)
