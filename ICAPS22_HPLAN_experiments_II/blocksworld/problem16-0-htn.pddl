( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b105 - block
    b771 - block
    b241 - block
    b416 - block
    b132 - block
    b400 - block
    b625 - block
    b274 - block
    b616 - block
    b910 - block
    b235 - block
    b156 - block
    b83 - block
    b516 - block
    b833 - block
    b591 - block
    b438 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b105 )
    ( on b771 b105 )
    ( on b241 b771 )
    ( on b416 b241 )
    ( on b132 b416 )
    ( on b400 b132 )
    ( on b625 b400 )
    ( on b274 b625 )
    ( on b616 b274 )
    ( on b910 b616 )
    ( on b235 b910 )
    ( on b156 b235 )
    ( on b83 b156 )
    ( on b516 b83 )
    ( on b833 b516 )
    ( on b591 b833 )
    ( on b438 b591 )
    ( clear b438 )
  )
  ( :tasks
    ( Make-16Pile b771 b241 b416 b132 b400 b625 b274 b616 b910 b235 b156 b83 b516 b833 b591 b438 )
  )
)
