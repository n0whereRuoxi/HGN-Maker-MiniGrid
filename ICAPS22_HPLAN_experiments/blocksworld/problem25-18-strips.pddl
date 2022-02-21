( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b91 - block
    b239 - block
    b688 - block
    b471 - block
    b739 - block
    b530 - block
    b411 - block
    b924 - block
    b531 - block
    b504 - block
    b211 - block
    b559 - block
    b642 - block
    b944 - block
    b202 - block
    b37 - block
    b894 - block
    b212 - block
    b420 - block
    b246 - block
    b32 - block
    b653 - block
    b449 - block
    b655 - block
    b322 - block
    b445 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b91 )
    ( on b239 b91 )
    ( on b688 b239 )
    ( on b471 b688 )
    ( on b739 b471 )
    ( on b530 b739 )
    ( on b411 b530 )
    ( on b924 b411 )
    ( on b531 b924 )
    ( on b504 b531 )
    ( on b211 b504 )
    ( on b559 b211 )
    ( on b642 b559 )
    ( on b944 b642 )
    ( on b202 b944 )
    ( on b37 b202 )
    ( on b894 b37 )
    ( on b212 b894 )
    ( on b420 b212 )
    ( on b246 b420 )
    ( on b32 b246 )
    ( on b653 b32 )
    ( on b449 b653 )
    ( on b655 b449 )
    ( on b322 b655 )
    ( on b445 b322 )
    ( clear b445 )
  )
  ( :goal
    ( and
      ( clear b91 )
    )
  )
)
