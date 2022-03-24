( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b900 - block
    b342 - block
    b337 - block
    b427 - block
    b74 - block
    b209 - block
    b76 - block
    b761 - block
    b857 - block
    b934 - block
    b45 - block
    b933 - block
    b182 - block
    b563 - block
    b522 - block
    b482 - block
    b470 - block
    b508 - block
    b217 - block
    b424 - block
    b168 - block
    b405 - block
    b425 - block
    b495 - block
    b544 - block
    b428 - block
    b468 - block
    b61 - block
    b599 - block
    b24 - block
    b637 - block
    b851 - block
    b841 - block
    b344 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b900 )
    ( on b342 b900 )
    ( on b337 b342 )
    ( on b427 b337 )
    ( on b74 b427 )
    ( on b209 b74 )
    ( on b76 b209 )
    ( on b761 b76 )
    ( on b857 b761 )
    ( on b934 b857 )
    ( on b45 b934 )
    ( on b933 b45 )
    ( on b182 b933 )
    ( on b563 b182 )
    ( on b522 b563 )
    ( on b482 b522 )
    ( on b470 b482 )
    ( on b508 b470 )
    ( on b217 b508 )
    ( on b424 b217 )
    ( on b168 b424 )
    ( on b405 b168 )
    ( on b425 b405 )
    ( on b495 b425 )
    ( on b544 b495 )
    ( on b428 b544 )
    ( on b468 b428 )
    ( on b61 b468 )
    ( on b599 b61 )
    ( on b24 b599 )
    ( on b637 b24 )
    ( on b851 b637 )
    ( on b841 b851 )
    ( on b344 b841 )
    ( clear b344 )
  )
  ( :tasks
    ( Make-33Pile b342 b337 b427 b74 b209 b76 b761 b857 b934 b45 b933 b182 b563 b522 b482 b470 b508 b217 b424 b168 b405 b425 b495 b544 b428 b468 b61 b599 b24 b637 b851 b841 b344 )
  )
)
