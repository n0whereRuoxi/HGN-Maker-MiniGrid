( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b560 - block
    b513 - block
    b894 - block
    b15 - block
    b171 - block
    b993 - block
    b423 - block
    b526 - block
    b690 - block
    b426 - block
    b663 - block
    b634 - block
    b469 - block
    b394 - block
    b481 - block
    b619 - block
    b432 - block
    b118 - block
    b110 - block
    b122 - block
    b348 - block
    b239 - block
    b771 - block
    b486 - block
    b925 - block
    b87 - block
    b669 - block
    b825 - block
    b120 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b513 b560 )
    ( on b894 b513 )
    ( on b15 b894 )
    ( on b171 b15 )
    ( on b993 b171 )
    ( on b423 b993 )
    ( on b526 b423 )
    ( on b690 b526 )
    ( on b426 b690 )
    ( on b663 b426 )
    ( on b634 b663 )
    ( on b469 b634 )
    ( on b394 b469 )
    ( on b481 b394 )
    ( on b619 b481 )
    ( on b432 b619 )
    ( on b118 b432 )
    ( on b110 b118 )
    ( on b122 b110 )
    ( on b348 b122 )
    ( on b239 b348 )
    ( on b771 b239 )
    ( on b486 b771 )
    ( on b925 b486 )
    ( on b87 b925 )
    ( on b669 b87 )
    ( on b825 b669 )
    ( on b120 b825 )
    ( clear b120 )
  )
  ( :tasks
    ( Make-28Pile b513 b894 b15 b171 b993 b423 b526 b690 b426 b663 b634 b469 b394 b481 b619 b432 b118 b110 b122 b348 b239 b771 b486 b925 b87 b669 b825 b120 )
  )
)
