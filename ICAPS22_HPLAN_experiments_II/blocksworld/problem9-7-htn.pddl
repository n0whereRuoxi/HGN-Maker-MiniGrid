( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b768 - block
    b493 - block
    b661 - block
    b262 - block
    b829 - block
    b252 - block
    b418 - block
    b108 - block
    b88 - block
    b399 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b768 )
    ( on b493 b768 )
    ( on b661 b493 )
    ( on b262 b661 )
    ( on b829 b262 )
    ( on b252 b829 )
    ( on b418 b252 )
    ( on b108 b418 )
    ( on b88 b108 )
    ( on b399 b88 )
    ( clear b399 )
  )
  ( :tasks
    ( Make-9Pile b493 b661 b262 b829 b252 b418 b108 b88 b399 )
  )
)
