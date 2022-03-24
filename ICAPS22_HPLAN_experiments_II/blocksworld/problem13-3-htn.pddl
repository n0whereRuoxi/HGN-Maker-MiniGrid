( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b215 - block
    b429 - block
    b641 - block
    b864 - block
    b926 - block
    b693 - block
    b409 - block
    b360 - block
    b955 - block
    b828 - block
    b796 - block
    b750 - block
    b452 - block
    b485 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b215 )
    ( on b429 b215 )
    ( on b641 b429 )
    ( on b864 b641 )
    ( on b926 b864 )
    ( on b693 b926 )
    ( on b409 b693 )
    ( on b360 b409 )
    ( on b955 b360 )
    ( on b828 b955 )
    ( on b796 b828 )
    ( on b750 b796 )
    ( on b452 b750 )
    ( on b485 b452 )
    ( clear b485 )
  )
  ( :tasks
    ( Make-13Pile b429 b641 b864 b926 b693 b409 b360 b955 b828 b796 b750 b452 b485 )
  )
)
