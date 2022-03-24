( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b376 - block
    b245 - block
    b107 - block
    b286 - block
    b326 - block
    b191 - block
    b325 - block
    b100 - block
    b168 - block
    b146 - block
    b853 - block
    b439 - block
    b298 - block
    b204 - block
    b241 - block
    b760 - block
    b738 - block
    b345 - block
    b39 - block
    b358 - block
    b479 - block
    b777 - block
    b148 - block
    b657 - block
    b395 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b376 )
    ( on b245 b376 )
    ( on b107 b245 )
    ( on b286 b107 )
    ( on b326 b286 )
    ( on b191 b326 )
    ( on b325 b191 )
    ( on b100 b325 )
    ( on b168 b100 )
    ( on b146 b168 )
    ( on b853 b146 )
    ( on b439 b853 )
    ( on b298 b439 )
    ( on b204 b298 )
    ( on b241 b204 )
    ( on b760 b241 )
    ( on b738 b760 )
    ( on b345 b738 )
    ( on b39 b345 )
    ( on b358 b39 )
    ( on b479 b358 )
    ( on b777 b479 )
    ( on b148 b777 )
    ( on b657 b148 )
    ( on b395 b657 )
    ( on b140 b395 )
    ( clear b140 )
  )
  ( :tasks
    ( Make-25Pile b245 b107 b286 b326 b191 b325 b100 b168 b146 b853 b439 b298 b204 b241 b760 b738 b345 b39 b358 b479 b777 b148 b657 b395 b140 )
  )
)
