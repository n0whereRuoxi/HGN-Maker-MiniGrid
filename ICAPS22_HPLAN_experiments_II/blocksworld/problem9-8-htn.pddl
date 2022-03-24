( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b879 - block
    b679 - block
    b744 - block
    b460 - block
    b104 - block
    b364 - block
    b255 - block
    b526 - block
    b832 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b879 )
    ( on b679 b879 )
    ( on b744 b679 )
    ( on b460 b744 )
    ( on b104 b460 )
    ( on b364 b104 )
    ( on b255 b364 )
    ( on b526 b255 )
    ( on b832 b526 )
    ( on b414 b832 )
    ( clear b414 )
  )
  ( :tasks
    ( Make-9Pile b679 b744 b460 b104 b364 b255 b526 b832 b414 )
  )
)
