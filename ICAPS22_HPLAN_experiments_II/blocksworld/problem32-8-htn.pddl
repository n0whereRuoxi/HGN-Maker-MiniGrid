( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b362 - block
    b3 - block
    b77 - block
    b35 - block
    b343 - block
    b313 - block
    b337 - block
    b483 - block
    b451 - block
    b589 - block
    b368 - block
    b167 - block
    b392 - block
    b49 - block
    b23 - block
    b341 - block
    b773 - block
    b735 - block
    b122 - block
    b777 - block
    b432 - block
    b264 - block
    b939 - block
    b638 - block
    b158 - block
    b531 - block
    b80 - block
    b991 - block
    b466 - block
    b86 - block
    b220 - block
    b233 - block
    b765 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b362 )
    ( on b3 b362 )
    ( on b77 b3 )
    ( on b35 b77 )
    ( on b343 b35 )
    ( on b313 b343 )
    ( on b337 b313 )
    ( on b483 b337 )
    ( on b451 b483 )
    ( on b589 b451 )
    ( on b368 b589 )
    ( on b167 b368 )
    ( on b392 b167 )
    ( on b49 b392 )
    ( on b23 b49 )
    ( on b341 b23 )
    ( on b773 b341 )
    ( on b735 b773 )
    ( on b122 b735 )
    ( on b777 b122 )
    ( on b432 b777 )
    ( on b264 b432 )
    ( on b939 b264 )
    ( on b638 b939 )
    ( on b158 b638 )
    ( on b531 b158 )
    ( on b80 b531 )
    ( on b991 b80 )
    ( on b466 b991 )
    ( on b86 b466 )
    ( on b220 b86 )
    ( on b233 b220 )
    ( on b765 b233 )
    ( clear b765 )
  )
  ( :tasks
    ( Make-32Pile b3 b77 b35 b343 b313 b337 b483 b451 b589 b368 b167 b392 b49 b23 b341 b773 b735 b122 b777 b432 b264 b939 b638 b158 b531 b80 b991 b466 b86 b220 b233 b765 )
  )
)
