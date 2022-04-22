( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b736 - block
    b156 - block
    b923 - block
    b326 - block
    b219 - block
    b797 - block
    b430 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b736 b424 )
    ( on b156 b736 )
    ( on b923 b156 )
    ( on b326 b923 )
    ( on b219 b326 )
    ( on b797 b219 )
    ( on b430 b797 )
    ( clear b430 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
