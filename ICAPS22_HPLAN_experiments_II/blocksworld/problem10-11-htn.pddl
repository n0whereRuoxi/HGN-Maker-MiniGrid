( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b1 - block
    b35 - block
    b383 - block
    b698 - block
    b907 - block
    b532 - block
    b564 - block
    b294 - block
    b355 - block
    b554 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b1 b180 )
    ( on b35 b1 )
    ( on b383 b35 )
    ( on b698 b383 )
    ( on b907 b698 )
    ( on b532 b907 )
    ( on b564 b532 )
    ( on b294 b564 )
    ( on b355 b294 )
    ( on b554 b355 )
    ( clear b554 )
  )
  ( :tasks
    ( Make-10Pile b1 b35 b383 b698 b907 b532 b564 b294 b355 b554 )
  )
)
