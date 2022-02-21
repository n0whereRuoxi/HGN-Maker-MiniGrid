( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b196 - block
    b969 - block
    b811 - block
    b291 - block
    b79 - block
    b758 - block
    b461 - block
    b944 - block
    b266 - block
    b947 - block
    b525 - block
    b159 - block
    b610 - block
    b989 - block
    b975 - block
    b819 - block
    b242 - block
    b914 - block
    b402 - block
    b935 - block
    b439 - block
    b726 - block
    b165 - block
    b436 - block
    b869 - block
    b274 - block
    b513 - block
    b502 - block
    b42 - block
    b538 - block
    b41 - block
    b578 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b196 )
    ( on b969 b196 )
    ( on b811 b969 )
    ( on b291 b811 )
    ( on b79 b291 )
    ( on b758 b79 )
    ( on b461 b758 )
    ( on b944 b461 )
    ( on b266 b944 )
    ( on b947 b266 )
    ( on b525 b947 )
    ( on b159 b525 )
    ( on b610 b159 )
    ( on b989 b610 )
    ( on b975 b989 )
    ( on b819 b975 )
    ( on b242 b819 )
    ( on b914 b242 )
    ( on b402 b914 )
    ( on b935 b402 )
    ( on b439 b935 )
    ( on b726 b439 )
    ( on b165 b726 )
    ( on b436 b165 )
    ( on b869 b436 )
    ( on b274 b869 )
    ( on b513 b274 )
    ( on b502 b513 )
    ( on b42 b502 )
    ( on b538 b42 )
    ( on b41 b538 )
    ( on b578 b41 )
    ( clear b578 )
  )
  ( :goal
    ( and
      ( clear b196 )
    )
  )
)
