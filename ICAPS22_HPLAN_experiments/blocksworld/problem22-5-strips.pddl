( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b851 - block
    b390 - block
    b207 - block
    b682 - block
    b312 - block
    b64 - block
    b25 - block
    b479 - block
    b538 - block
    b314 - block
    b558 - block
    b197 - block
    b258 - block
    b591 - block
    b555 - block
    b119 - block
    b631 - block
    b642 - block
    b470 - block
    b632 - block
    b112 - block
    b358 - block
    b704 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b390 b851 )
    ( on b207 b390 )
    ( on b682 b207 )
    ( on b312 b682 )
    ( on b64 b312 )
    ( on b25 b64 )
    ( on b479 b25 )
    ( on b538 b479 )
    ( on b314 b538 )
    ( on b558 b314 )
    ( on b197 b558 )
    ( on b258 b197 )
    ( on b591 b258 )
    ( on b555 b591 )
    ( on b119 b555 )
    ( on b631 b119 )
    ( on b642 b631 )
    ( on b470 b642 )
    ( on b632 b470 )
    ( on b112 b632 )
    ( on b358 b112 )
    ( on b704 b358 )
    ( clear b704 )
  )
  ( :goal
    ( and
      ( clear b851 )
    )
  )
)
