( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b151 - block
    b323 - block
    b502 - block
    b524 - block
    b363 - block
    b470 - block
    b124 - block
    b564 - block
    b438 - block
    b165 - block
    b569 - block
    b929 - block
    b430 - block
    b785 - block
    b56 - block
    b816 - block
    b628 - block
    b174 - block
    b869 - block
    b526 - block
    b7 - block
    b523 - block
    b41 - block
    b478 - block
    b42 - block
    b231 - block
    b258 - block
    b477 - block
    b778 - block
    b642 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b151 )
    ( on b323 b151 )
    ( on b502 b323 )
    ( on b524 b502 )
    ( on b363 b524 )
    ( on b470 b363 )
    ( on b124 b470 )
    ( on b564 b124 )
    ( on b438 b564 )
    ( on b165 b438 )
    ( on b569 b165 )
    ( on b929 b569 )
    ( on b430 b929 )
    ( on b785 b430 )
    ( on b56 b785 )
    ( on b816 b56 )
    ( on b628 b816 )
    ( on b174 b628 )
    ( on b869 b174 )
    ( on b526 b869 )
    ( on b7 b526 )
    ( on b523 b7 )
    ( on b41 b523 )
    ( on b478 b41 )
    ( on b42 b478 )
    ( on b231 b42 )
    ( on b258 b231 )
    ( on b477 b258 )
    ( on b778 b477 )
    ( on b642 b778 )
    ( clear b642 )
  )
  ( :goal
    ( and
      ( clear b151 )
    )
  )
)
