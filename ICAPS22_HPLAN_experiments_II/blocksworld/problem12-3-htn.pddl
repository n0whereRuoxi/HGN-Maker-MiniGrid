( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b805 - block
    b548 - block
    b452 - block
    b405 - block
    b311 - block
    b273 - block
    b150 - block
    b752 - block
    b553 - block
    b43 - block
    b131 - block
    b399 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b805 b70 )
    ( on b548 b805 )
    ( on b452 b548 )
    ( on b405 b452 )
    ( on b311 b405 )
    ( on b273 b311 )
    ( on b150 b273 )
    ( on b752 b150 )
    ( on b553 b752 )
    ( on b43 b553 )
    ( on b131 b43 )
    ( on b399 b131 )
    ( clear b399 )
  )
  ( :tasks
    ( Make-12Pile b805 b548 b452 b405 b311 b273 b150 b752 b553 b43 b131 b399 )
  )
)
