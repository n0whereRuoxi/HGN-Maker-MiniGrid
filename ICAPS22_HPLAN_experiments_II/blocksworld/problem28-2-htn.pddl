( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b707 - block
    b807 - block
    b11 - block
    b197 - block
    b414 - block
    b624 - block
    b372 - block
    b855 - block
    b187 - block
    b397 - block
    b461 - block
    b534 - block
    b679 - block
    b234 - block
    b90 - block
    b538 - block
    b893 - block
    b864 - block
    b366 - block
    b613 - block
    b836 - block
    b108 - block
    b597 - block
    b128 - block
    b442 - block
    b18 - block
    b497 - block
    b996 - block
    b416 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b707 )
    ( on b807 b707 )
    ( on b11 b807 )
    ( on b197 b11 )
    ( on b414 b197 )
    ( on b624 b414 )
    ( on b372 b624 )
    ( on b855 b372 )
    ( on b187 b855 )
    ( on b397 b187 )
    ( on b461 b397 )
    ( on b534 b461 )
    ( on b679 b534 )
    ( on b234 b679 )
    ( on b90 b234 )
    ( on b538 b90 )
    ( on b893 b538 )
    ( on b864 b893 )
    ( on b366 b864 )
    ( on b613 b366 )
    ( on b836 b613 )
    ( on b108 b836 )
    ( on b597 b108 )
    ( on b128 b597 )
    ( on b442 b128 )
    ( on b18 b442 )
    ( on b497 b18 )
    ( on b996 b497 )
    ( on b416 b996 )
    ( clear b416 )
  )
  ( :tasks
    ( Make-28Pile b807 b11 b197 b414 b624 b372 b855 b187 b397 b461 b534 b679 b234 b90 b538 b893 b864 b366 b613 b836 b108 b597 b128 b442 b18 b497 b996 b416 )
  )
)
