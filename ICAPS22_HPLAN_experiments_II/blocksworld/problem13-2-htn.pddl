( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b724 - block
    b582 - block
    b415 - block
    b712 - block
    b110 - block
    b749 - block
    b864 - block
    b235 - block
    b912 - block
    b976 - block
    b205 - block
    b655 - block
    b542 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b724 )
    ( on b582 b724 )
    ( on b415 b582 )
    ( on b712 b415 )
    ( on b110 b712 )
    ( on b749 b110 )
    ( on b864 b749 )
    ( on b235 b864 )
    ( on b912 b235 )
    ( on b976 b912 )
    ( on b205 b976 )
    ( on b655 b205 )
    ( on b542 b655 )
    ( on b3 b542 )
    ( clear b3 )
  )
  ( :tasks
    ( Make-13Pile b582 b415 b712 b110 b749 b864 b235 b912 b976 b205 b655 b542 b3 )
  )
)
