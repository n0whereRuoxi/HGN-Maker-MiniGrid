( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b423 - block
    b192 - block
    b966 - block
    b932 - block
    b675 - block
    b754 - block
    b491 - block
    b640 - block
    b120 - block
    b286 - block
    b478 - block
    b57 - block
    b813 - block
    b512 - block
    b504 - block
    b431 - block
    b962 - block
    b337 - block
    b638 - block
    b817 - block
    b804 - block
    b608 - block
    b261 - block
    b281 - block
    b854 - block
    b522 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b423 )
    ( on b192 b423 )
    ( on b966 b192 )
    ( on b932 b966 )
    ( on b675 b932 )
    ( on b754 b675 )
    ( on b491 b754 )
    ( on b640 b491 )
    ( on b120 b640 )
    ( on b286 b120 )
    ( on b478 b286 )
    ( on b57 b478 )
    ( on b813 b57 )
    ( on b512 b813 )
    ( on b504 b512 )
    ( on b431 b504 )
    ( on b962 b431 )
    ( on b337 b962 )
    ( on b638 b337 )
    ( on b817 b638 )
    ( on b804 b817 )
    ( on b608 b804 )
    ( on b261 b608 )
    ( on b281 b261 )
    ( on b854 b281 )
    ( on b522 b854 )
    ( clear b522 )
  )
  ( :goal
    ( and
      ( clear b423 )
    )
  )
)
