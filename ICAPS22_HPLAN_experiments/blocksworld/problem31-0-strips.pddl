( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b534 - block
    b430 - block
    b897 - block
    b262 - block
    b996 - block
    b704 - block
    b24 - block
    b273 - block
    b72 - block
    b918 - block
    b485 - block
    b508 - block
    b55 - block
    b309 - block
    b317 - block
    b86 - block
    b431 - block
    b338 - block
    b260 - block
    b8 - block
    b882 - block
    b258 - block
    b949 - block
    b555 - block
    b837 - block
    b939 - block
    b165 - block
    b635 - block
    b862 - block
    b206 - block
    b639 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b534 )
    ( on b430 b534 )
    ( on b897 b430 )
    ( on b262 b897 )
    ( on b996 b262 )
    ( on b704 b996 )
    ( on b24 b704 )
    ( on b273 b24 )
    ( on b72 b273 )
    ( on b918 b72 )
    ( on b485 b918 )
    ( on b508 b485 )
    ( on b55 b508 )
    ( on b309 b55 )
    ( on b317 b309 )
    ( on b86 b317 )
    ( on b431 b86 )
    ( on b338 b431 )
    ( on b260 b338 )
    ( on b8 b260 )
    ( on b882 b8 )
    ( on b258 b882 )
    ( on b949 b258 )
    ( on b555 b949 )
    ( on b837 b555 )
    ( on b939 b837 )
    ( on b165 b939 )
    ( on b635 b165 )
    ( on b862 b635 )
    ( on b206 b862 )
    ( on b639 b206 )
    ( on b367 b639 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b534 )
    )
  )
)
