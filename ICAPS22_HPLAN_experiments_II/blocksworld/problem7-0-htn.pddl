( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b493 - block
    b243 - block
    b182 - block
    b880 - block
    b14 - block
    b231 - block
    b437 - block
    b521 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b243 b493 )
    ( on b182 b243 )
    ( on b880 b182 )
    ( on b14 b880 )
    ( on b231 b14 )
    ( on b437 b231 )
    ( on b521 b437 )
    ( clear b521 )
  )
  ( :tasks
    ( Make-7Pile b243 b182 b880 b14 b231 b437 b521 )
  )
)
