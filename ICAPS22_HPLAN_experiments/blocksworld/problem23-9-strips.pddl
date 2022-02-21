( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b817 - block
    b207 - block
    b365 - block
    b357 - block
    b632 - block
    b296 - block
    b562 - block
    b563 - block
    b91 - block
    b498 - block
    b516 - block
    b806 - block
    b405 - block
    b882 - block
    b978 - block
    b24 - block
    b877 - block
    b332 - block
    b983 - block
    b389 - block
    b262 - block
    b673 - block
    b112 - block
    b394 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b817 )
    ( on b207 b817 )
    ( on b365 b207 )
    ( on b357 b365 )
    ( on b632 b357 )
    ( on b296 b632 )
    ( on b562 b296 )
    ( on b563 b562 )
    ( on b91 b563 )
    ( on b498 b91 )
    ( on b516 b498 )
    ( on b806 b516 )
    ( on b405 b806 )
    ( on b882 b405 )
    ( on b978 b882 )
    ( on b24 b978 )
    ( on b877 b24 )
    ( on b332 b877 )
    ( on b983 b332 )
    ( on b389 b983 )
    ( on b262 b389 )
    ( on b673 b262 )
    ( on b112 b673 )
    ( on b394 b112 )
    ( clear b394 )
  )
  ( :goal
    ( and
      ( clear b817 )
    )
  )
)
