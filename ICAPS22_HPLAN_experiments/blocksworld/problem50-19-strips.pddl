( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b34 - block
    b122 - block
    b601 - block
    b212 - block
    b493 - block
    b625 - block
    b445 - block
    b844 - block
    b525 - block
    b782 - block
    b19 - block
    b38 - block
    b407 - block
    b192 - block
    b234 - block
    b326 - block
    b650 - block
    b185 - block
    b175 - block
    b672 - block
    b823 - block
    b754 - block
    b534 - block
    b303 - block
    b387 - block
    b550 - block
    b605 - block
    b388 - block
    b874 - block
    b102 - block
    b957 - block
    b801 - block
    b432 - block
    b4 - block
    b635 - block
    b478 - block
    b238 - block
    b682 - block
    b151 - block
    b450 - block
    b869 - block
    b329 - block
    b50 - block
    b718 - block
    b427 - block
    b602 - block
    b323 - block
    b939 - block
    b584 - block
    b9 - block
    b306 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b34 )
    ( on b122 b34 )
    ( on b601 b122 )
    ( on b212 b601 )
    ( on b493 b212 )
    ( on b625 b493 )
    ( on b445 b625 )
    ( on b844 b445 )
    ( on b525 b844 )
    ( on b782 b525 )
    ( on b19 b782 )
    ( on b38 b19 )
    ( on b407 b38 )
    ( on b192 b407 )
    ( on b234 b192 )
    ( on b326 b234 )
    ( on b650 b326 )
    ( on b185 b650 )
    ( on b175 b185 )
    ( on b672 b175 )
    ( on b823 b672 )
    ( on b754 b823 )
    ( on b534 b754 )
    ( on b303 b534 )
    ( on b387 b303 )
    ( on b550 b387 )
    ( on b605 b550 )
    ( on b388 b605 )
    ( on b874 b388 )
    ( on b102 b874 )
    ( on b957 b102 )
    ( on b801 b957 )
    ( on b432 b801 )
    ( on b4 b432 )
    ( on b635 b4 )
    ( on b478 b635 )
    ( on b238 b478 )
    ( on b682 b238 )
    ( on b151 b682 )
    ( on b450 b151 )
    ( on b869 b450 )
    ( on b329 b869 )
    ( on b50 b329 )
    ( on b718 b50 )
    ( on b427 b718 )
    ( on b602 b427 )
    ( on b323 b602 )
    ( on b939 b323 )
    ( on b584 b939 )
    ( on b9 b584 )
    ( on b306 b9 )
    ( clear b306 )
  )
  ( :goal
    ( and
      ( clear b34 )
    )
  )
)
