( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b965 - block
    b872 - block
    b203 - block
    b505 - block
    b685 - block
    b207 - block
    b215 - block
    b378 - block
    b962 - block
    b306 - block
    b385 - block
    b716 - block
    b956 - block
    b197 - block
    b428 - block
    b642 - block
    b485 - block
    b848 - block
    b185 - block
    b8 - block
    b947 - block
    b845 - block
    b181 - block
    b829 - block
    b737 - block
    b136 - block
    b441 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b965 )
    ( on b872 b965 )
    ( on b203 b872 )
    ( on b505 b203 )
    ( on b685 b505 )
    ( on b207 b685 )
    ( on b215 b207 )
    ( on b378 b215 )
    ( on b962 b378 )
    ( on b306 b962 )
    ( on b385 b306 )
    ( on b716 b385 )
    ( on b956 b716 )
    ( on b197 b956 )
    ( on b428 b197 )
    ( on b642 b428 )
    ( on b485 b642 )
    ( on b848 b485 )
    ( on b185 b848 )
    ( on b8 b185 )
    ( on b947 b8 )
    ( on b845 b947 )
    ( on b181 b845 )
    ( on b829 b181 )
    ( on b737 b829 )
    ( on b136 b737 )
    ( on b441 b136 )
    ( clear b441 )
  )
  ( :tasks
    ( Make-26Pile b872 b203 b505 b685 b207 b215 b378 b962 b306 b385 b716 b956 b197 b428 b642 b485 b848 b185 b8 b947 b845 b181 b829 b737 b136 b441 )
  )
)
